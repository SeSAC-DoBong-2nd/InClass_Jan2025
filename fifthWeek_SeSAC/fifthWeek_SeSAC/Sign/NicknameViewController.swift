//
//  NicknameViewController.swift
//  SeSACFiveWeek
//
//  Created by Jack on 1/23/25.
//

import UIKit
import SnapKit

class NicknameViewController: UIViewController {
   
    let nicknameTextField = SignTextField(placeholderText: "닉네임을 입력해주세요")
    let nextButton = PointButton(title: "다음")
     
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureLayout()
         
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(jackReceivedNotification),
                                               name: NSNotification.Name("jack"),
                                               object: nil)
    }
    
    deinit {
        print(self)
    }
    
    @objc
    func jackReceivedNotification(notification: NSNotification) {
        //이곳에서 값 넣어주기
        if let name = notification.userInfo!["value"] as? String {
            print(#function, name)
        } else {
            print(#function, "~~~")
        }
    }
    
    @objc func nextButtonClicked() {
        //뒤로 돌아가면 안되니까
        //window의 rootViewController를 교체

        //scene + window
        
        //iOS 15.0부터 deprecated
//        UIApplication.shared.windows.first
        
//        guard let windowScene =  UIApplication.shared.connectedScenes.first as? UIWindowScene,
//              let window = windowScene.windows.first
//        else { return }
//        
//        window.rootViewController = UINavigationController(rootViewController: MainViewController())
//        window.makeKeyAndVisible()
        
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    func configureLayout() {
        view.addSubview(nicknameTextField)
        view.addSubview(nextButton)
        
        nicknameTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

}

