//
//  PracticeViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 12/31/24.
//

import UIKit

class PracticeViewController: UIViewController {

    let colorList: [UIColor] = [.red, .orange, .yellow, .green, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self, #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
    }
    
    //2023 wwdc에서 등장
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
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
    
    //스토리보드에서 연결하는 것이 아닌, 직접 타이핑 해야하는 코드
    //터널: unwind
    @IBAction func unwindToPracticeViewController(_ sender: UIStoryboardSegue) {
        print(#function)
    }
    
}
