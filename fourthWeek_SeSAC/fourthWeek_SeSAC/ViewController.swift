//
//  ViewController.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/13/25.
//

import UIKit

import SnapKit

/** [스토리보드로 화면 만드는 순서]
 1. 스토리보드에서 객체 얹기
 2. 객체 레이아웃 잡기
 3. 아웃렛 연결하기
 4. 객체 속성 코드로 조절하기
 */

//Right To Left, Left To Right
//아랍 등은 우측에서 글을 쓰기에 left와 right는 좌우가 고정이라 LTR의 국가에서는 대응이 되지 않아,
//  leading과 trailing으로 autoLayout을 설정하여 LTR 국가에서도 앱의 화면 대응이 가능하도록 한다.

class ViewController: UIViewController {
    
    //1. 뷰 객체 프로퍼티 선언
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let nameTextField = UITextField()
    
    let redView = UIView()
    let greenView = UIView()
    let grayView = UIView()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        print("button")
        btn.setTitle("다음", for: .normal)
        btn.backgroundColor = .brown
        btn.addTarget(self, action: #selector(nextButtonTapeed), for: .touchUpInside)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        freameBasedLayout()
        autoLayoutConstraints()
        autoLayoutAnchor()
//        autoLayoutSnapKit()
        autoLayoutSnapKit2()
        configureButton()
    }
    
    func configureButton() {
        view.addSubview(button)
        
        
        button.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(300)
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
    }
    

    func freameBasedLayout() {
        //2. addSubview로 뷰 추가
        view.addSubview(emailTextField)
        
        //3. 뷰의 위치와 크기 설정
        emailTextField.frame = CGRect(x: 50,
                                      y: 100,
                                      width: 293,
                                      height: 50)
        
        //4. 뷰 속성 조절
        emailTextField.backgroundColor = .red
    }
    
    func autoLayoutConstraints() {
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(
            item: passwordTextField,
            attribute: .top,
            relatedBy: .equal,
            toItem: view.safeAreaLayoutGuide,
            attribute: .top,
            multiplier: 1,
            constant: 50
        )
        //??.isActive = true
        //NSLayout이 적용되게 해주세요.
        
        let leading = NSLayoutConstraint(
            item: passwordTextField,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1,
            constant: 40
        )
        
        let trailing = NSLayoutConstraint(
            item: passwordTextField,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1,
            constant: -40
        )
        
        let height = NSLayoutConstraint(
            item: passwordTextField,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .height,
            multiplier: 1,
            constant: 50
        )
        
        view.addConstraints([top, leading, trailing, height])
        
        passwordTextField.backgroundColor = .blue
    }
    
    func autoLayoutAnchor() {
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            nameTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func autoLayoutSnapKit() {
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(grayView)
        
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        grayView.backgroundColor = .gray
        
        redView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        greenView.snp.makeConstraints {
            $0.center.equalTo(view.safeAreaLayoutGuide)
            $0.size.equalTo(200)
        }
        
        grayView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom).offset(50)
            $0.centerX.equalTo(greenView.snp.centerX).offset(-100)
            $0.size.equalTo(200)
        }
    }
    
    func autoLayoutSnapKit2() {
        view.addSubview(redView)
        view.addSubview(grayView)
        redView.addSubview(greenView)
        
        redView.backgroundColor = .red
        grayView.backgroundColor = .gray
        greenView.backgroundColor = .green
        
        redView.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.center.equalToSuperview()
        }
        
        grayView.snp.makeConstraints {
            $0.edges.equalTo(redView).inset(50)
        }
        
        greenView.snp.makeConstraints {
            //여기서 equalToSuperview는 redView 이다.
            //redView에 addSubview 되었기 때문.
            $0.edges.equalToSuperview()
        }
    }
    
    @objc
    func nextButtonTapeed() {
        print(#function)
        let vc = BookViewController()
        present(vc, animated: true)
    }

}
