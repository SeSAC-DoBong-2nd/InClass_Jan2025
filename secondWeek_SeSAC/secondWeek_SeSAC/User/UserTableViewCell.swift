//
//  UserTableViewCell.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/3/25.
//

import UIKit

import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"

    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    //처음에 뷰 프로퍼티에 대한 코드를 작성할 때 한번 설정하고 더이상 바뀌지 않을 코드를 작성한다.
    
    //스토리보드로 구현한 경우에만 실행되는 메서드,
    //같은 역할을 하는 다른 메서드가 존재(코드베이스)
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        profileImageView.image = UIImage(systemName: "person")
    }
    
    private func configure() {
        profileImageView.backgroundColor = .lightGray
        nameLabel.font = .boldSystemFont(ofSize: 15)
        messageLabel.font = .systemFont(ofSize: 12)
        messageLabel.numberOfLines = 0
    }
    
    func configureData(row: Friends) {
        print(#function)
        nameLabel.text = row.nameDescription
        messageLabel.text = row.message

        let image1 = row.profile_image
        
        if let image1 {
            let url = URL(string: image1)
            profileImageView.kf.setImage(with: url)
        }
//        else {
//            profileImageView.image = UIImage(systemName: "person")
//        }
        
        // like == true -> heart.fill
        // like == false -> heart
        let name = row.like ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: name), for: .normal)
    }
    
}
