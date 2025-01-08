//: [Previous](@previous)

import UIKit

// Method Requirements
// 구조체, 클래스, 열거형 등을 서포트할 수 있다.

// 클래스(UIViewController, UITableViewCell 같은 녀석들한테만 쓰는 프로토콜)
  // 클래스에만 주고싶은 특성을 만들 때에는 class 인스턴스만 받을 수 있는 AnyObject로 프로토콜에 제약을 설정해버리자.

// tableView.delegate = self
// -> Protocol as Type

protocol Mentor {
    
}

class Jack: Mentor {}

class Hue: Mentor {}

struct Bran: Mentor {}

struct Den: Mentor {}

//Mentor 라는 프로토콜을 채택한 것이라면 어떤 것이든 mentor 변수에 넣을 수 있다.
//그렇기에 protocol이 Type과 같이 사용되는 case
//따라서 아래 mentor = Bran() 또한 가능
var mentor: Mentor = Jack()
mentor = Bran()




// 옵셔널 프로토콜 (Optional Requirments)
  // 프로토콜 메서드 혹 프로퍼티 중 일부의 상황일 때만 사용되는 것이라 옵셔널로 다루고 싶을 경우.
@objc
protocol ViewPresentableProtocol: AnyObject {
    
    //프로퍼티는 항상 var로 선언해야 한다.
    //값을 가져올지 세팅해줄지 정도만 명세해준다.
    //프로퍼티 우측에 적힌 것은 최소 조건!!
    //즉 backgroundColor는 get이 무조건 쓰여야 하는 거고, set은 선택사항이다!
    var backgroundColor: UIColor { get }
    var navigationTitleString: String { get set }
    
    func configureNavigationItem()
    func configureView()
    @objc optional func configureTextField()
    
}

class SearchViewController: ViewPresentableProtocol {
    
    var backgroundColor: UIColor {
        return .blue
    }
    
    var navigationTitleString: String {
        get {
            "안녕하세요"
        }
        set {
            "\(newValue)입니다."
        }
    }
    
    func configureNavigationItem() {
        <#code#>
    }
    
    func configureView() {
        <#code#>
    }
    
}

// 프로토콜 명세를 따르는 타입 == 프로토콜을 준수(confirm)한다.
class SettingViewController: ViewPresentableProtocol {
    func configureNavigationItem() {
        print(navigationTitleString) //get
        print(backgroundColor) //get
    }
    
    func configureView() {
        <#code#>
    }
    
    func configureTextField() {
        <#code#>
    }
}

struct User: ViewPresentableProtocol {
    func configureNavigationItem() {
        <#code#>
    }
    
    func configureView() {
        <#code#>
    }
    
    func configureTextField() {
        <#code#>
    }
}

//extension SearchViewController: ViewPresentableProtocol {
//    
//    func configureNavigationItem() {
//        <#code#>
//    }
//    
//    func configureView() {
//        <#code#>
//    }
//    
//    func configureTextField() {
//        <#code#>
//    }
//    
//}



//: [Next](@next)
