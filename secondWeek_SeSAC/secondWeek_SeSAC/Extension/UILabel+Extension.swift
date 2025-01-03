//
//  UILabel+Extension.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/2/25.
//

import UIKit

extension UILabel {
    
    //self를 사용하는 것은 extension으로 확장하는 UILabel 스스로의 label을 뜻함
    func setPrimaryLabel(_ text: String) {
        self.font = .boldSystemFont(ofSize: 20)
        self.textColor = .green
        self.textAlignment = .center
        self.text = text
    }
    
}
