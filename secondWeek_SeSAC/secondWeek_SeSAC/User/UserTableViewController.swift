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
        
        //Xib cell 추가할 경우 사용해야하는 코드
//        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
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
    
}
