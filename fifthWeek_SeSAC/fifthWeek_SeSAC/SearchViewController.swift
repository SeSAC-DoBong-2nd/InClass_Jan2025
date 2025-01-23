//
//  SearchViewController.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/22/25.
//

import UIKit

import SnapKit

class SearchViewController: UIViewController {
    
    let textField = UITextField()
    
    func example() { //
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //해당 매서드의 위치가 어떤 lifecycle에서 더 애니메이션이 자연스러울지 테스트해보자
//        textField.becomeFirstResponder() //키보드 활성화
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        textField.becomeFirstResponder() //키보드 활성화
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(textField)
        textField.backgroundColor = .yellow
        
        
        
        textField.delegate = self
        
        textField.snp.makeConstraints {
            $0.top.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("키보드 return 클릭")
        
        //resign = 하지마라
        //키보드를 내리는 것이 아닌, textField가 클릭된 커서를 취소하는 것이라, 키보드가 내려가는 것.
        textField.resignFirstResponder()
        
        return true
    }
}
