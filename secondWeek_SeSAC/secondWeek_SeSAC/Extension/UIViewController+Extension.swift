//
//  UIViewController+Extension.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/2/25.
//

import UIKit

//UIViewController를 상속받은 모든 곳에서 쓸 수 있다.
extension UIViewController {
    
    //extension은 저장 프로퍼티의 역할을 담고있지 않기에 변수를 선언하여 해당 변수에 값을 대입할 수 없다.
    // var nickname = "psy"
    
    func setViewBackground() {
        view.backgroundColor = .cyan
    }
    
    func showAlert() {
        
    }
    
}
