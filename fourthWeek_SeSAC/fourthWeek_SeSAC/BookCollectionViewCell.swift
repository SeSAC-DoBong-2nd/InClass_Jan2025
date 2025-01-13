//
//  BookCollectionViewCell.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/13/25.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookCollectionViewCell"
    
    let bookCoverImageView = UIImageView()
    
    //Cell 파일에서의 viewDidLoad or awakeFromNib 과 같음
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Cell에는 contentView가 존재!
        //그냥 addSubview하여도 화면에 보이기는 하나,
        //꼭!!! contentView에다가 뷰를 추가해주어야 액션이 동작한다!
        contentView.addSubview(bookCoverImageView)
        
        bookCoverImageView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        bookCoverImageView.backgroundColor = .brown
        bookCoverImageView.contentMode = .scaleAspectFill
    }
    
    //너는 머야~
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
