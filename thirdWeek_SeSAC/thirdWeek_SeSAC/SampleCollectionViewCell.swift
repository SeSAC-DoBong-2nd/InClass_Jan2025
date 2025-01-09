//
//  SampleCollectionViewCell.swift
//  thirdWeek_SeSAC
//
//  Created by 박신영 on 1/9/25.
//

import UIKit

class SampleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SampleCollectionViewCell"

    //예약어 = var, let 과 같은 애플이 이미 만들어둔 키워드
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
//    override func layoutIfNeeded() {
//        <#code#>
//    }
    
    // layoutSubviews
    //cell의 하위뷰가 업데이트 돼야할 필요성이 있을 때 실행되는 메서드
//    override func layoutSubviews() {
//        imageView.layer.cornerRadius = imageView.frame.width / 2
//    }

}
