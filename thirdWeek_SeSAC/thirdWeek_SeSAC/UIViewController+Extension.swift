//
//  UIViewController+Extension.swift
//  thirdWeek_SeSAC
//
//  Created by 박신영 on 1/9/25.
//

import UIKit

extension UIViewController {
    
    func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let width = UIScreen.main.bounds.width //현재 디바이스의 넓이
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
//        layout.itemSize = CGSize(width: width, height: 160)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return layout
    }
    
}
