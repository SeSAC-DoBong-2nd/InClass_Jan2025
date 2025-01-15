//
//  BlackRadiusLabel.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/15/25.
//

import UIKit

class BaseLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //@available(*, unavailable)을 사용한다면 해당 BaseLabel을 상속받는 이들은 required init을 사용하지 않아도 된다.
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PointButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BlackRadiusLabel: BaseLabel {
    
    init(fontColor: UIColor) {
        super.init(frame: .zero)
        
        font = .boldSystemFont(ofSize: 15)
        textColor = fontColor
        backgroundColor = .black
        layer.cornerRadius = 10
        clipsToBounds = true
        textAlignment = .center
    }
    
    //코드베이스로 코드를 구성할 때 호출되는 초기화 구문
    //override는 상속이기에 슈퍼클래스로 구현된 init임을 인지
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //스토리보드로 구성할 때 호출되는 초기화 구문
    //프로토콜에 구현된 init => Required Initializer
    //실패가능한 이니셜라이저 (=Failable Initializer)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

/*
protocol SeSAC {
    init()
}

class Mentor: SeSAC {
    
    required init() {
        print("Mentor Init")
    }
    
}

class Jack: Mentor {
    
    required init() {
        super.init()
        
        print("Jack Init")
    }
    
}
*/
