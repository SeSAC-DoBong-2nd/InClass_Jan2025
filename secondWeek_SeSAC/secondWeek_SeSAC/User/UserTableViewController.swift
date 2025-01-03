//
//  UserTableViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/3/25.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    let name = ["고래밥", "칙촉", "카스타드"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return name.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        
        cell.profileImageView.backgroundColor = .brown
        cell.nameLabel.text = name[indexPath.row]
        cell.messageLabel.text = "상태 메세지"
        
        cell.nameLabel.font = .boldSystemFont(ofSize: 15)
        cell.messageLabel.font = .systemFont(ofSize: 12)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

}
