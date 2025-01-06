//
//  UIColor+Extension.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/6/25.
//

import UIKit

extension UIColor {
    //저장 프로퍼티, 인스턴스 프로퍼티
    //인스턴스가 생성된 다음 호출할 수 있는 저장 프로퍼티이기에 extension 내에서는 사용이 불가능하다.
//    var psyColor = UIColor.systemBlue
    
    //저장 프로퍼티, 타입 프로퍼티
    //static은 인스턴스와는 상관 없이 한 곳에 저장하여 사용하기에 사용 가능하다.
    static var backgroundColor = UIColor.systemBlue
    
    //연산 프로퍼티
    var denColor: UIColor {
        return .red
    }
}
