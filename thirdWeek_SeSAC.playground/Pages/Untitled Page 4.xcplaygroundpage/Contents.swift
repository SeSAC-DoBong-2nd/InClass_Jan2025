//: [Previous](@previous)

import Foundation

UserDefaults.standard.set(100, forKey: "age")

UserDefaults.standard.integer(forKey: "age")

class PSYUserDefaults {
    
    var age: Int {
        get {
            UserDefaults.standard.integer(forKey: "age")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "age")
        }
        
    }
    
    var nickname: String {
        get {
            UserDefaults.standard.string(forKey: "nickname") ?? "훈케이"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "nickname")
        }
    }
    
}

let psy = PSYUserDefaults()
psy.age = 50
psy.nickname = "psy"


import UIKit

class VC: UIViewController {
    
    let psy = PSYUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = psy.nickname
        print(psy.age)
    }
    
    func saveButtonTapped() {
        psy.nickname = "~~~"
    }
    
}


//: [Next](@next)
