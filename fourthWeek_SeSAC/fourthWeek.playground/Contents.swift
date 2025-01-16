import UIKit

/*
 Function Types
 
 
 First Class Object
 - 조건
 1. 변수 or 상수에 함수를 쓸 수 있다.
 2. 인자값에 사용할 수 있다.
 3. 반환값에 사용할 수 있다.
 */

//이는 함수를 상수에 담은 것이 아닌, 함수를 실행하고 난 결과를 상수에 담은 것.
//즉, 함수 그 자체를 담은 것은 아니다.
//let jack1 = introduce() //String

//아래 코드가 함수 그 자체를 상수에 담은 것
//let jack2 = introduce //() -> String
//jack2 정의인 위 코드에 jack2 실행인 아래 코드가 완벽하게 분리해서 사용할 수 있다.
//왜냐하면 jack2에 함수 자체가 담겼기 때문.
//jack2()


//Function Types: () -> String
func introduce() -> String {
    print("안녕하세용")
    return "안녕하세용"
}

let test = {
    print("안녕하세용")
    return "안녕하세용"
}

//Function Types: (String) -> String
func introduce(name: String) -> String {
    return "안녕하세요 저는 \(name)입니다."
}

//in의 역할
//함수의 정해져있는 틀. 즉, 형식과 함수의 본문을 나누어줄 때 사용되는 키워드.
//in을 기준으로 좌측은 클로저 헤더이고, 우측내용은 클로저 바디이다.
// 클로저 헤더 in 클로저 바디
let bran = { make in //클로저헤더
    return "안녕하세요 저는 \(make)입니다." //클로저바디
}

//Function Types: (String) -> String
func introduce(nickname: String) -> String {
    return "안녕하세요 저는 \(nickname)입니다."
}


//Function Types: () -> ()
func introduce() {
    print("안녕하세요")
}

//함수의 오버로딩 특성으로, 함수를 구별하기 어려워지면 타입어노테이션으로 함수를 구분할 수 있다.
//타입어노테이션의 형태마저 같아 함수를 구별하기 어렵다면, 함수 식별자로 구분할 수 있다.
let jack: (String) -> String = introduce(name:)

//이렇게 함수 자체를 받은 jack을 호출할 때에는 name을 생략하고 쓸 수 있다.
jack("dd")


func oddNumber() {
    print("홀수")
}

func evenNumber() {
    print("짝수")
}

//아래와 odd와 even의 매개변수와 같이 펑션타입 자체를 해당 매개변수 타입으로 정의가 가능하다.
//즉, 함수의 인자값으로 펑션타입을 넣는 것이니 인자값으로 사용이 된다는 것이다.
func resultNumber(value: Int, odd: () -> (), even: () -> ()) {
    if value.isMultiple(of: 2) {
        even()
    } else {
        odd()
    }
}

resultNumber(value: 4, odd: {
    print("짝수")
}, even: {
    print("홀수")
})
//위 코드를 아래와 같이 바꿀 수 있다.
resultNumber(value: 4) {
    print("짝수")
} even: {
    print("홀수")
}


