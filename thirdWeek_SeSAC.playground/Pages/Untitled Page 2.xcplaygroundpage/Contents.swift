import UIKit

//연산 프로퍼티
class BMI {
    var weight: Double
    var height: Double
    
    var bmiResult: String {
        // bmi 지수 계산
        let bmiValue = (weight * weight) / height
        // bmi 결과
        let bmiResult = bmiValue < 18.5 ? "저체중" : "정상 이상"
        let result = "bmi 지수는 \(bmiValue)로, \(bmiResult) 상태 입니다."
        return result
        
    }
    
    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
    }
}

let bmi = BMI(weight: 50, height: 1.6)

bmi.bmiResult





//선언과 초기화는 따로 할 수 있다.
//하지만 초기화(초기값)를 해야 해당 변수를 쓸 수 있다.

class Movie {
    let title: String
    let runtime: Int
    lazy var video = Video() //지연 저장 프로퍼티: 왜 var 만 될까?
                            //왜냐하면 이 프로퍼트의 초기값을 인스턴스 초기화가 완료된 시점까지 알 수 없기 때문입니다.
                            //상수 프로퍼티는 초기화가 끝나기전까지 반드시 값을 가져야하기 때문에, lazy로 선언될 수 없습니다.

    init(title: String, runtime: Int) {
        self.title = title
        self.runtime = runtime
        print("Movie Init")
    }
}

class Video {
    var file = UIImage(systemName: "star") //2gb
    
    init() {
        print("Video Init")
    }
}

var media = Movie(title: "훈징어게임2", runtime: 134)

media.video //Video init


//인스턴스: class랑 구조체 안에 속한 것을 표현

class Monster {
    static let game = "카트라이더" //타입 저장 프로퍼티
    
    let clothes: String //인스턴스 저장 프로퍼티
    let speed: Int //인스턴스 프로퍼티
    let exp: Int //인스턴스 프로퍼티
    
    static func ment() { //타입 메서드
        print("크헉!")
    }
    
    func attack() { //인스턴스 메서드
        print("공격!")
    }
    
    //init 구문을 통해 Monster 객체를 만들 때 값을 할당받아 사용할 수 있다.
    init(clothes: String, speed: Int, exp: Int) {
        self.clothes = clothes
        self.speed = speed
        self.exp = exp
    }
}

//클래스 내의 모든 변수들이 초기화가 되어 있어야 사용할 수 있다.
//= 클래스 내 모든 프로퍼티가 초기값이 지정되어 있어야 한다.
//인스턴스가 생성되면, 프로퍼티에 접근할 수 있기에 명칭을 인스턴스 프로퍼티라 칭하는 것이다.
//인스턴스 생성과 상관없이 접근할 수 있는 프로퍼티/메서드가 있다.
var easy: Monster? = Monster(clothes: "Blue", speed: 1, exp: 1)
easy?.clothes
easy?.speed
easy?.exp
easy?.attack()

easy = nil //easyMonster가 더이상 필요 없어져서 nil을 대입하면 차지하고 있던 메모리 공간마저 사라지게 만들 수 있다.

var hard: Monster? = Monster(clothes: "Yellow", speed: 100, exp: 1000)
hard?.clothes
hard?.speed
hard?.exp
hard?.attack()

hard = nil

hard?.clothes // == nil

Monster.game // = "카트라이더"

//Monster 클래스 자체에서 접근하는 타입 프로퍼티 game
Monster.game
