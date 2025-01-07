//
//  BrownViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class BrownViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    
    //1. Pass Data - 데이터 받은 공간(프로퍼티 생성)
    var contents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3. Pass Data - 전달 받은 값을 화면에 표현
        testLabel.text = contents
        
        navigationItem.title = "키키몬"
    }
    
    @IBAction
    func popButtonTapped(_ sender: UIButton) {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func disMissButtonTapped(_ sender: UIButton) {
        print(#function)
        dismiss(animated: true)
    }

}
