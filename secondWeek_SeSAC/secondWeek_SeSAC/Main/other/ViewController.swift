//
//  ViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 12/30/24.
//

import UIKit

import Kingfisher

class ViewController: UIViewController {

    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var recommendButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommendButton.setTitle("케케몬", for: .normal)
        recommendButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        print(resultLabel.isUserInteractionEnabled)
        resultLabel.isUserInteractionEnabled = true
        recommendButton.isEnabled = false
        
        setImageWithKingfisher()
    }
    
    func setImageWithKingfisher() {
        guard let url = URL(string: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDExMDFfMTM3%2FMDAxNzMwNDYzODc5ODU0.meCeuaHml0JG3krvkft2VNL_Lyf1w_AjWdkjDQaYMa0g.IGVflFw0rofsvUsVNUxmJCuoYPiCiawmRQkw7qH6E_4g.JPEG%2FIMG_3311.jpg&type=a340") else {
            posterImage.image = UIImage(systemName: "x.circle")
            return
        }
        posterImage.kf.setImage(with: url)
    }
    
    //Did End On Exit
    //UITextField text, UILabel text : String?
    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        //대문자로 바꿔주는 uppercase
        var text = wordTextField.text!.uppercased()
        
        //공백다루는 whitespace
        text = text.trimmingCharacters(in: .whitespaces)
        
        if text.count == 0 {
            resultLabel.text = "검색어를 작성해주세요."
        } else if text == "jmt" {
            resultLabel.text = "완전 맛남"
        } else {
            resultLabel.text = "\(text)를 입력하였습니다."
        }
    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        print("케케몬")
    }
    
    func aboutOptional() {
        //: String? = 옵셔널 스트링 타입
        var nickname: String? = "psy"
        nickname = nil
        var age: Int? = nil
        //옵셔널 해결 방법
        
        //1. 조건문을 통해 옵셔널 언래핑
        if nickname == nil {
            print("지금 닉네임 nil 값")
        } else {
            print("\(nickname!)으로 설정합니다.")
        }
        
        //2. 옵셔널 바인딩: if let / guard let
        if let nickname {
            print("\(nickname)으로 설정합니다.")
        } else {
            print("지금 닉네임 nil 값")
        }
        if let age = age {
            print(age)
        } else {
            print("age의 값이 nil 입니다.")
        }
        guard let age else {
            print("현재 age의 값이 nil 입니다.")
            return // guard let의 else문을 끝내겠다. like 샹크스
        }
        print(age)
        
        //3. ??
        print(nickname ?? "손님")
        
        //4. 옵셔널 체이닝
        wordTextField.text?.count
        //해당 코드에서 text뒤에 ?가 붙는게 '옵셔널 체이닝'이다.
        //원래 아래 코드와 같이 옵셔널을 해제하고 사용해야 하지만, 간단하게 text의 ?를 사용하여 nil 여부를 판단하고 nil이라면 이후의 코드를 실행하지 않음으로써 앱이 터지는 것을 방지함.
        if let text = wordTextField.text {
            print(text.count)
        }
        
    }
}

