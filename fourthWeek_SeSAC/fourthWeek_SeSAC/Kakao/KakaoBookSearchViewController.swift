//
//  KakaoBookSearchViewController.swift
//  SeSACFourthWeek
//
//  Created by Jack on 1/14/25.
//

import UIKit

import Alamofire
import SnapKit

/*
 페이지네이션
 1. 스크롤이 끝날 쯤 다음 페이지를 요청 (page += 1 후 getAPI 함수 호출)
 2. 이전 내용도 확인해야 해서 list에 값을 대입하는게 아닌 append로 수정
 
 - 이거 고쳐야하지 않을까? 작성해보자.
 내 생각:
 a. 중복호출 방지
 b. prefetchRowsAt으로 불러온 리소스들 미리 준비하기
   b-1. 이미지 kingfisher로 처리할 때 다운샘플링 하기
 c. 검색결과 없을 때 대응?
 
 Jack님 생각:
 a. 새로운 단어를 검색했을 때에 대한 대응
   - list 배열 초기화 + page 변수 1로 초기화 + 상단 스크롤
 b. 마지막 페이지인 경우
   - 더 이상 호출하지 않기
 */

class KakaoBookSearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    var list: [Documents] = []
    var page: Int = 1
    var beforeSearchText: String = " "
    var isEnd = false

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureSearchBar()
        configureTableView()
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureSearchBar() {
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        searchBar.delegate = self
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
        
        tableView.rowHeight = 120
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(KakaoBookSearchTableViewCell.self, forCellReuseIdentifier: KakaoBookSearchTableViewCell.id)
        
        tableView.keyboardDismissMode = .onDrag
    }

}

private extension KakaoBookSearchViewController {
    
    func getKakaoBookAPI(query: String) {
//        view.endEditing(true)
        
        let url = "https://dapi.kakao.com/v3/search/book"
        
        print(#function, url)
        
        let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakaoRestAPIKey)"]
        
        AF.request(url,
                   method: .get,
                   parameters: ["query": query, "size": 20, "page": self.page],
                   headers: header)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: KakaoAPIResponseModel.self)
        { response in
            
            switch response.result {
                
            case .success(let result):
                print("success")
                dump(result.documents)
                if self.page == 1 {
                    self.list = result.documents
                } else {
                    self.list.append(contentsOf: result.documents)
                }
                
                self.isEnd = result.meta.is_end
                
                self.tableView.reloadData()
                
                if self.page == 1 {
                    //스크롤을 indexPath 기준 최상단으로 올리기
                    self.tableView.scrollToRow(
                        at: IndexPath(row: 0, section: 0),
                        at: .top,
                        animated: false
                    )
                }
                
                /* 내가 쓴 코드
                if self.beforeSearchText != query {
                    self.list.removeAll()
                }
                //page 1이라면 1-20
                //page 2라면 21-40
                self.list.append(contentsOf: result.documents)
                self.tableView.reloadData()
                 */
                
            case .failure(let error):
                print("failure")
                print(error)
            }
            
        }
    }
    
}

extension KakaoBookSearchViewController: UISearchBarDelegate {

    //검색 버튼 클릭 시 무조건 통신되지 않고,
    //빈칸, 최소 1자 이상, 같은 글자에 대한 처리 필요!
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        print(#function)
//        if beforeSearchText != text {
            beforeSearchText = text
            page = 1
            getKakaoBookAPI(query: text)
//        }
        
    }
    
}

extension KakaoBookSearchViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print(#function, indexPaths)
        //현재 size 20 => [0, 19]
        for item in indexPaths {
            if (list.count - 2) == item.row && isEnd == false {
                page += 1
                page <= 6 ? getKakaoBookAPI(query: beforeSearchText) : print("")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print(#function, indexPaths)
        //사용자가 페이지를 빠르게 스크롤하면, 중간에 지나가는 셀이 생기고,
        //  그 셀에 대해서는 데이터 처리가 필요없을 수도 있어, 이미 다운로드 같은 기능을 취소하는 작업을 구현!
    }
    
}


extension KakaoBookSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KakaoBookSearchTableViewCell.id,
                                                       for: indexPath)
                as? KakaoBookSearchTableViewCell else { return UITableViewCell() }
        
        let data = list[indexPath.row]
        cell.titleLabel.text = "\(data.title)"
        cell.overviewLabel.text = "\(data.contents)"
        cell.thumbnailImageView.kf.setImage(with: URL(string: data.thumbnail))
//        print(#function)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print(#function)
//    }
    
    //UIScrollViewDelegate에 있으나 tableview가 scrollview를 상속받고 있으니 사용 가능.
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(#function, scrollView.contentSize.height, scrollView.contentOffset.y)
//    }
    
}

