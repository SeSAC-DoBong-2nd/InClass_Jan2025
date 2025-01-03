//
//  NumberViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 12/30/24.
//

import UIKit

class NumberViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewBackground()
        
        dateLabel.text = getToday()
        
        //UserDefaults에 저장된 데이터 가져와 활용하기
        textField.text = UserDefaults.standard.string(forKey: "number")
    }
    
    //함수의 내용이 짧을 경우 return 생략 가능
    //Swift5.1: Implicit returns
    func randomInt() -> Int {
        Int.random(in: 1...100)
    }
    
    //@: Swift Attributes
    @discardableResult func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        
        let today = format.string(from: Date())
        
        return today
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(textField.text, forKey: "number")
        print(#function) // 해당 함수가 잘 실행되는지 확인
        
        //사용자에게 성공적으로 저장이 되었다는 알림을 주기
        //Alert (.alert, .actionSheet)
        ///1. 타이틀 + 메세지
        let alert = UIAlertController(
            title: "저장되었습니다",
            message: "숫자가 성공적으로 저장되었어요",
            preferredStyle: .alert
        )
        let alert2 = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        ///2. 버튼
        let okBtn = UIAlertAction(title: "확인", style: .default)
        let okBtn1 = UIAlertAction(title: "test1", style: .default)
        let okBtn2 = UIAlertAction(title: "test2", style: .default)
        let okBtn3 = UIAlertAction(title: "test3", style: .default)
        
        ///3. 본문에 버튼 추가: addAction 순서대로 버튼의 순서가 정해짐
        ///단 style이 .cancel이면 제일 하단으로 내려감
        alert.addAction(okBtn)
        alert.addAction(okBtn1)
        alert.addAction(okBtn2)
        alert.addAction(okBtn3)
        
        ///4. 화면에 alert 띄우기
        present(alert, animated: true)
    }
    
    //Event: Editing Changed
    @IBAction func textFieldTextChanged(_ sender: UITextField) {
        //1. 실시간으로 레이블에 내용 반영
        //Optional String -> String
        //UITextField의 Text를 String 타입으로 변경
        guard let text = textField.text else {
            return print("케케 지금 text 값 nil")
        }
        resultLabel.text = text
        
        //2. 입력한 내용이 숫자라면 숫자 그대로 출력
        //jack: "5" -> 5
        if Int(text) != nil {
            print(Int(text)!)
        } else {
            print("숫자가 아닙니다.")
        }
        if let intText = Int(text) {
            print(Int(text)!)
        } else {
            print("숫자가 아닙니다.")
        }
        
        //3. 입력한 내용이 문자라면 숫자가 아닙니다 출력
        if let intText = Int(text) {
            resultLabel.text = String(intText)
        } else {
            resultLabel.text = "숫자가 아닙니다."
        }
        
        
        /** 다른 방식 1
        guard let text = sender.text else {
            print("지금 textField text nil 값")
            return
        }
            
        for i in text {
            if !i.isNumber {
                resultLabel.text = "숫자가 아닙니다."
                return
            }
        }
        
        resultLabel.text = text
         */
        
        /** 다른 방식 2
         guard let text = textField.text,
               let num = Int(text)
         else {
             resultLabel.text = "숫자가 아닙니다."
             return
         }
         resultLabel.text = text
         */
    }
    
}
