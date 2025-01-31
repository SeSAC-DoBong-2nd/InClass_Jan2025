//
//  UIButton+Extension.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/31/25.
//

import UIKit

extension UIButton.Configuration {
    
    static func sesacStyleBtn() -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "star")
        config.title = "로그인하기"
        config.baseForegroundColor = .brown
        config.baseBackgroundColor = .darkGray
        
        return config
    }
    
}
