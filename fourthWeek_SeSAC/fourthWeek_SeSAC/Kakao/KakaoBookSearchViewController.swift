//
//  KakaoBookSearchViewController.swift
//  SeSACFourthWeek
//
//  Created by Jack on 1/14/25.
//

import UIKit

import Alamofire
import SnapKit



class KakaoBookSearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    var list: [Documents] = []

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
        tableView.register(KakaoBookSearchTableViewCell.self, forCellReuseIdentifier: KakaoBookSearchTableViewCell.id)
        
        tableView.keyboardDismissMode = .onDrag

    }

}

private extension KakaoBookSearchViewController {
    
    func getKakaoBookAPI(query: String) {
//        view.endEditing(true)
        
        let url = "https://dapi.kakao.com/v3/search/book"
        let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakaoRestAPIKey)"]
        
        AF.request(url,
                   method: .get,
                   parameters: ["query": query],
                   headers: header)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: KakaoAPIResponseModel.self)
        { response in
            
            switch response.result {
                
            case .success(let result):
                print("success")
                dump(result.documents)
                self.list = result.documents
                self.tableView.reloadData()
                
            case .failure(let error):
                print("failure")
                print(error)
            }
            
        }
    }
    
}

extension KakaoBookSearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        print(#function)
        getKakaoBookAPI(query: text)
    }
    
}


extension KakaoBookSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        return cell
    }
    
}

