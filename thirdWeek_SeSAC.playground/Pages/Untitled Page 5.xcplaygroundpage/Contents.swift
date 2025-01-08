//: [Previous](@previous)

import Foundation

var nickname = "고래밥"
var subnickname = nickname

nickname = "칙촉"

print(nickname, subnickname)


class User {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
}

let psy = User(name: "psy")
var jack = psy
psy.name = "jack"

print(psy.name, jack.name)
