//
//  MainViewController.swift
//  SeSACFiveWeek
//
//  Created by Jack on 1/23/25.
//

import UIKit
import SnapKit


protocol PassDataDelegate: AnyObject {
    func nicknameReceived(title: String)
}

class MainViewController: UIViewController {
   
    let statusLabel = UILabel()
    let nextButton = PointButton(title: "처음으로")
    let profileButton = PointButton(title: "Profile")
    
    deinit {
        print(self)
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureLayout()
         
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        
        profileButton.addTarget(self, action: #selector(delegateBtnTapped), for: .touchUpInside)
        
        //Notification
        //obserber: 어디서 받을래, selector: addtarget과 동일. name: notification 등록한 이름, object: 무시
//        NotificationCenter.default.addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(jackReceivedNotification),
                                               name: NSNotification.Name("jack"),
                                               object: nil)
    }
    
    @objc
    func delegateBtnTapped() {
        print(#function)
        
        let vc = DelegateViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func closureButtonTapped() {
        print(#function)
        
        let vc = ClosureViewController()
        
        vc.contents = { value in
            print("클로저 테스트 : \(value)")
            self.statusLabel.textColor = .blue
            self.statusLabel.text = value
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func sample() {
        print("클로저 테스트")
        self.statusLabel.textColor = .blue
    }
    
    @objc
    func jackReceivedNotification(notification: NSNotification) {
        //이곳에서 값 넣어주기
        statusLabel.text = "123123"
        if let name = notification.userInfo!["value"] as? String {
            statusLabel.text = name
        } else {
            statusLabel.text = "데이터가 안 왔다."
        }
    }
    
    @objc
    func nextButtonClicked() {
        navigationController?.pushViewController(EmailViewController(), animated: true)
    }
    
    @objc
    func profileButtonClicked() {
        print(#function)
        
        NotificationCenter.default.post(name: NSNotification.Name("sesac"),
                                        object: nil,
                                        userInfo: ["myData": statusLabel.text!])
        
        navigationController?.pushViewController(NotificationViewController(), animated: true)
    }
    
    func configureLayout() {
        view.addSubview(statusLabel)
        view.addSubview(nextButton)
        view.addSubview(profileButton)
         
        statusLabel.text = "메인 화면"
        
        profileButton.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.top.centerX.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(statusLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

}

extension MainViewController: PassDataDelegate {
    
    func nicknameReceived(title: String) {
        print(#function)
        statusLabel.textColor = .red
        statusLabel.text = title
    }
    
}
