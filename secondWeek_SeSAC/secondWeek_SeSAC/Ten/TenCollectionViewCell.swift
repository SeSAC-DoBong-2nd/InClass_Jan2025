//
//  TenCollectionViewCell.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class TenCollectionViewCell: UICollectionViewCell {

    @IBOutlet var posterImageView: UIImageView!
    let label = UILabel()
    
    static let format = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        TenCollectionViewCell.format.dateFormat = "yy년 MM월 dd일"
        let result = TenCollectionViewCell.format.string(from: Date())
        label.text = result
        
        posterImageView.backgroundColor = .systemBlue
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
    }

}
