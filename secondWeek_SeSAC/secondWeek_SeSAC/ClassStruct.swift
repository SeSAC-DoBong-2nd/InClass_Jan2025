//
//  ClassStruct.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/2/25.
//

import Foundation

//1. 가지고 있는 프로퍼티를 모두 초기화
//2. 가지고 있는 프로퍼티를 옵셔널로 선언
class Monster {
    var clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    
    ////initializer == init
    ///init도 함수!
    init(clothes: String, speed: Int, power: Int, experience: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
    }
}

class BossMonster: Monster {
    
}

class SuperMonster: BossMonster {
    
}


///Struct는 init을 따로 해주지 않아도 시스템상에서 이미 init을 해주고 있음.
struct MosterStruct {
    var clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    
    //init 이 없더라도 기본적으로 제공해줌! == memberWwizeInitialize(멤버와이즈 초기화 구문)
}
