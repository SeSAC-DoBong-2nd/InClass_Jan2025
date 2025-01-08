//
//  UserTableViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/3/25.
//

import UIKit

import Kingfisher

struct Friend {
    let name: String
    let message: String
    let profile_image: String
}

class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func loadView() {
    }
    
//    let friends = [
//        Friend(name: "고래밥", message: "배고파", profile_image: "star.circle.fill"),
//        Friend(name: "고래밥 냠냠", message: "행복한 하루", profile_image: "pencil"),
//        Friend(name: "칙촉", message: "헝그리", profile_image: "star.fill")
//    ]
    
    // 위 방법으로 개선
//    let name = ["고래밥", "칙촉", "카스타드"]
//    let message = ["고래밥 냠냠", "행복한 하루", "배고파"]
//    let profile = ["star", "pencil", "star.fill"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "케케몬"
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(rightNavButtonTapped))
        navigationItem.rightBarButtonItem = rightBtn
        
        //Xib cell 추가할 경우 사용해야하는 코드
//        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
    }
    
    @objc
    func rightNavButtonTapped() {
        //같은 스토리보내 내에서 전환할 때에는 'self.storyboard'키워드로 내가 위치한 스토리보드를 자동으로 지정하고 이후 같은 코드를 사용할 수 있다. (self는 언제든지 생략가능)
        // self.storyboard?.instantiateViewController(withIdentifier: <#T##String#>)
        
        //1. 뷰컨트롤러가 위치한 스토리보드 특정
        let sb = UIStoryboard(name: "User", bundle: nil)
        
        //2. 전환할 뷰컨트롤러 가져오기
        let grayVC = sb.instantiateViewController(withIdentifier: "GrayViewController") as! GrayViewController
        
        //3. 화면을 전환할 방법 선택하기 - 우측에서 등장 / show / navi / push
        navigationController?.pushViewController(grayVC, animated: true)
    }
    
    @objc
    func likeButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        
        print(friends[sender.tag])
        
        friends[sender.tag].like.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        print(friends[sender.tag])
    }

    
    // MARK: - TableView data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //UserTableViewCell 인스턴스
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
        let row = friends[indexPath.row]
        
        cell.configureData(row: row)
        
        
        //kf 활용: 더미로 받은 profile image 주소가 유효했다면 아래와 같이 구상 가능
//        let imageURL = URL(string: friends[indexPath.row].profile_image ?? "")
//        cell.profileImageView.kf.setImage(with: imageURL)
        
//        let image = friends[indexPath.row].profile_image ?? "person.fill"
//        cell.profileImageView.image = UIImage(systemName: image)
        
        //각 셀별 버튼을 구분하기 위해서 tag를 분류
        cell.likeButton.tag = indexPath.row
        
        //IBAction 대신 코드로 연결
        //self: 각 셀별 버튼 자체를 사용하기에 self를 사용
        //Function Types
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        //내가 한 방법
//        row.like ? cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        : cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        /**스토리보드 활용 화면 전환 코드**/
        
        //1. 뷰컨트롤러가 위치한 스토리보드 특정
        let sb = UIStoryboard(name: "User", bundle: nil)
        
        //2. 전환할 뷰컨트롤러 가져오기
        let brownVC = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        
        //값 전달 시 아웃렛 활용 할 수 없음 (해당 코드가 실행되는 시점보다 아웃렛이 나중에 만들어진다)
//        brownVC.testLabel.text = "케케몬"
        
        // 2. Pass Data - vc가 갖고있는 프로퍼티에 데이터 대입
        brownVC.contents = friends[indexPath.row].name
        
        //(옵션 1) 어떤 modalPresentationStyle 을 지정했냐에 따라 modalTransitionStyle 이 적용 되지 않거나, 런타임 에러가 발생.
        brownVC.modalPresentationStyle = .fullScreen //아래에서 위로 뜰 때 방식
        brownVC.modalTransitionStyle = .crossDissolve //전환 애니메이션
        
        //(옵션 2) present 이지만 navtitle도 쓰고 싶다면, 다시 네비게이션 컨트롤러를 임베드하여, 네비게이션 컨트롤러를 present 보내면 된다.
        let nav = UINavigationController(rootViewController: brownVC)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        
        //3. 화면을 전환할 방법 선택하기 - 아래에서 위로 / modal / present
        present(nav, animated: true)
        
        //스토리보드에서 엔트리포인트를 잘못설정해 navigationController가 없다면 옵셔널체이닝 코드인 '?' 기준으로 이후 코드가 실행되지 않을 수 있다.
//        navigationController?.pushViewController(brownVC, animated: true)

        
        //다시 화면 돌아왔을 때 셀 선택된 거 없애기.
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
}
