//
//  UIViewController+Extension.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/22/25.
//

import UIKit

import Then

//Generic: 타입에 유연하게 대응할 수 있다.

//T: Type Parameter의 약자
//  - placeHolder와 같은 역할 (무슨 타입인지는 모르지만 동일한 타입이 들어올 것이라는 것을 알려줌)

//Type Constaints: 네모박스 제약설정
//  - 방법 1: 클래스로 제약설정
//  - 방법 2: 프로토콜로 제약설정

//함수 구성에서는 타입을 알 수 없고, 함수를 호출할 때 타입이 결정된다.
//  - 아래 plus와 configureBorder가 정의된 것을 보면 T에 어떤 타입이 들어올 지 알 수 없다.
//  - 그러나 해당 함수들을 호출할 때 매개변수를 넣으면 그 매개변수에 의해 어떠한 타입인지 알 수 있다.
// but 컴파일타임에는 어떠한 타입이 들어올 지는 알아야 한다.
//  - 즉 런타임 시 알 수 있는게 아닌, 컴파일 시점에서도 코드를 짜는 우리는 알고 있어야 한다.

extension UIViewController {
    //모든 타입을 허용하는 네모박스. = T
    //방법 2로 Numeric 이라는 프로토콜로 제약설정 (string 못 더함)
    //방법 2로 ??? 이라는 제약설정 (string 더함) 찾어보자.   - 안 외워도 됨
    func plus<T: Numeric>(a: T, b: T) -> T {
        return a + b
    }
    
    //방법 1로 UIView 라는 class로 제약 설정
    func configureBorder<T: UIView>(view: T) {
        view.do {
            $0.layer.borderColor = UIColor.red.cgColor
            $0.layer.borderWidth = 2
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.backgroundColor = .clear
        }
    }
    
    func example<T>(a: T, compltionHanlder: @escaping (T) -> Void) -> String {
        return "안녕하세요"
    }
    
}
