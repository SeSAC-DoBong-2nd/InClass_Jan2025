import UIKit

class User {
    
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("Class init")
    }
    
    deinit {
        print("Class deinit")
    }
    
}

var jack: User? = User(name: "jack", age: 21)
print("----")
jack?.age
jack?.name

print("nil before")
jack = nil

print("nil after")
jack?.age
jack?.name


