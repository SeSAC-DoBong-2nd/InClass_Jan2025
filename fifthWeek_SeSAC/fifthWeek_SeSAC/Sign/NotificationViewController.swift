//
//  NotificationViewController.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/23/25.
//

import UIKit

class NotificationViewController: UIViewController {
    
    let emailTextField = SignTextField(placeholderText: "노티피케이션을 통한 값전달")
    let nextButton = PointButton(title: "저장하기")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureLayout()
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        
        //post 전에 observer가 먼저 등록되어 있어야 notification의 기능을 수행할 수 있다.
        //따라서 정방향으로 notification을 사용한다면 기능하지 않는다.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(jackReceivedNotification),
                                               name: NSNotification.Name("sesac"),
                                               object: nil)
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
    
    @objc func nextButtonClicked() {
        print(#function)
        
        //Notification을 통해 값을 보내기
        NotificationCenter.default.post(name: NSNotification.Name("jack"),
                                        object: nil,
                                        userInfo: ["nickname": "나야",
                                                   "value": emailTextField.text!])
        
        navigationController?.popViewController(animated: true)
    }

    @objc
    func jackReceivedNotification(notification: NSNotification) {
        //이곳에서 값 넣어주기
        if let name = notification.userInfo!["myData"] as? String {
            emailTextField.text = name
        } else {
            emailTextField.text = "데이터가 안 왔다."
        }
    }

}
