//: [Previous](@previous)

import Foundation

class Mobile {
    // 인스턴스 저장 프로퍼티
    var name: String
    var nickname = "고래밥" {
        willSet {
            print("willSet", newValue, nickname)
        }
        didSet {
            print("didSet", oldValue, nickname)
        }
    }
    
    // 인스턴스 연산 프로퍼티
    var introduce: String {
        get {
            return "당신은 \(name)제품을 구매했고, 구매 날짜는 \(Date())입니다."
        }
        set {
            name = newValue
            nickname = newValue
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    
    func buy() {
        print("구매했습니다.")
    }
}

class Google: Mobile {
    override func buy() {
        print("안드로이드 구매했습니다.")
    }
}

class Apple: Mobile {
    let wwdc = "WWDC"
    
    override func buy() {
        print("구매했습니다.")
    }
}

let phone: Mobile = Mobile(name: "Phone")
print("당신은 \(phone.name)제품을 구매했고, 구매 날짜는 \(Date())입니다.")
//phone.introduce = "오잉"
phone.nickname = "케케문"

let google: Google = Google(name: "Google")

let apple: Apple = Apple(name: "Apple")


phone is Mobile
google is Mobile


phone is Google
phone is Apple

apple is Google


var iPhone: Mobile = Apple(name: "APPLE")
iPhone = Google(name: "케케몬")
print(iPhone.buy())
//as? 옵셔널 반환 타입 -> 타입캐스팅 실패하면 nil 반환 가능
//as! -> 타입캐스팅 실패하면 무조건 런타임 오류 발생
//let example = iPhone as! Apple

if let phone = iPhone as? Apple {
    phone.wwdc
} else {
    print("에러")
}


//Any(전부) vs AnyObject(클래스의 인스턴스)
//AnyObject는 class의 인스턴스만 들어올 수 있다. 구조체, enum 등의 인스턴스는 원소가 될 수 없음.

var sometings: [Any] = []
sometings.append(2)
sometings.append(iPhone)
sometings.append("카카몬")

print(type(of: sometings))

if let element = sometings[0] as? Bool {
    print(element)
}

if let element = sometings[1] as? Google {
    print(element.name)
}
