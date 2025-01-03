//
//  SecondViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 12/31/24.
//

import UIKit

class SecondViewController: UIViewController {

    let colorList: [UIColor] = [.red, .orange, .yellow, .green, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self, #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self, #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self, #function)
    }
    

}
