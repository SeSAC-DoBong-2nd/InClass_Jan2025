//
//  BookViewController.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/13/25.
//

import UIKit

import SnapKit

class BookViewController: UIViewController {
    
    let mainView = BookView()
    //VCLifeCycle 중 가장 먼저 실행.
    //VC의 view를 다른 view와 갈아끼울 수 있음
    //절대 super 메서드 호출하면 안됨
      //왜냐하면 apple의 uiview를 다시금 정의하는 거니까 내가 원하는 뷰로 안 바뀔 수 있음
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //아래 코드 풀이
        //name이라는 매개변수를 갖는 함수를 넣어 주는데, 나는 name 이라는 매개변수를 네비게이션 title에 쓰고 싶어
        NetworkManager.shared.randomUser { name in
            print("escaping NetworkManager.shared.randomUser 1")
            self.navigationItem.title = name
            print("escaping NetworkManager.shared.randomUser 2")
        }
        print("escaping NetworkManager.shared.randomUser 3")
    }
    
}

