//
//  TenCollectionViewCell.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class TenCollectionViewCell: UICollectionViewCell {

    @IBOutlet var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.backgroundColor = .systemBlue
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
    }

}
