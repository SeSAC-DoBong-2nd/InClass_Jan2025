//
//  AnimationViewController.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/31/25.
//

import UIKit

import SnapKit
import Lottie

final class AnimationViewController: UIViewController {
    
    private let animationImageView = LottieAnimationView(name: "Test")
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    private let loginButton = UIButton()
//    : UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("로그인", for: .normal)
//        button.backgroundColor = .systemPurple
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 5
//        return button
//    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "계정이 없으신가요? 회원가입"
        label.textColor = .systemBlue
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "S-CoreDream-9Black", size: 30)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpAnimations()
        setUpLoginBtn()
        
        for family in UIFont.familyNames {
            print(family)
            for name in UIFont.fontNames(forFamilyName: family) {
             print("name: ",name)
            }
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
            UIView.animate(withDuration: 5.0) {
                self.logoImageView.alpha = 1
                self.logoImageView.transform = CGAffineTransform(rotationAngle: 500)
            } completion: { _ in
                self.animationEmailTextField()
            }
        }
    }
    
    private func setUpLoginBtn() {
        loginButton.configuration = UIButton.Configuration.sesacStyleBtn()
    }
    
    private func animationEmailTextField() {
//        UIView.animate(withDuration: 0.3, delay: 1, options: [.autoreverse, .repeat]) {
        UIView.animate(withDuration: 0.3) {
            self.emailTextField.alpha = 1
        } completion: { _ in
            self.animationPasswordTextField()
        }
    }
    
    private func animationPasswordTextField() {
        UIView.animate(withDuration: 0.3) {
            self.passwordTextField.alpha = 1
        } completion: { _ in
            self.animationLoginBtn()
        }
    }
    
    private func animationLoginBtn() {
        UIView.animate(withDuration: 0.3) {
            self.loginButton.alpha = 1
        } completion: { _ in
            self.animationSignLabel()
        }
    }
    
    private func animationSignLabel() {
        UIView.animate(withDuration: 3) {
            self.signUpLabel.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse,.repeat]) {
                self.animationImageView.play()
            }
            
        }
    }
    
    private func setUpAnimations() {
        //시작 isHidden true -> false
        
        emailTextField.alpha = 0
        passwordTextField.alpha = 0
        signUpLabel.alpha = 0
        loginButton.alpha = 0
        logoImageView.alpha = 0
        
        logoImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        
    }
    
    private func setUpViews() {
        view.backgroundColor = .white
        
        [logoImageView, emailTextField, passwordTextField, loginButton, signUpLabel]
            .forEach { view.addSubview($0) }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.width.height.equalTo(100)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.left.right.height.equalTo(emailTextField)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.left.right.equalTo(emailTextField)
            make.height.equalTo(44)
        }
        
        signUpLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(animationImageView)
        animationImageView.snp.makeConstraints {
            $0.bottom.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
    }
    
}
