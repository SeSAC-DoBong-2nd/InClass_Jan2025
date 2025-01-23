//
//  DelegateViewController.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/23/25.
//

import UIKit

class DelegateViewController: UIViewController {
    
    let emailTextField = SignTextField(placeholderText: "delegate를 통한 값전달")
    let nextButton = PointButton(title: "저장하기")
    
    //화면 전환 트리거
    weak var delegate: PassDataDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureLayout()
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
    }
    

    func configureLayout() {
        view.addSubview(emailTextField)
        view.addSubview(nextButton)
         
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    @objc
    func nextButtonClicked() {
        print(#function)
        
        //동일한 인스턴스의 메인뷰컨트롤러를 어떻게 가져오지?
        //타입으로서의 프로토콜을 활용해보자!
        delegate?.nicknameReceived(title: emailTextField.text!)
        
        navigationController?.popViewController(animated: true)
    }

}
