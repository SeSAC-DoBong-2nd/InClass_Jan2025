//
//  GroupViewController.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/21/25.
//

import UIKit

import Kingfisher

struct User {
    static let age = 11
}


class GroupViewController: UIViewController {
    
    let firstImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    let secondImageView = {
        let view = UIImageView()
        view.backgroundColor = .orange
        return view
    }()
    
    let thirdImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let checkButton = {
        let view = UIButton()
        view.backgroundColor = .blue
        return view
    }()
    
    var firstValue = ""
    var secondValue = ""
    var thirdValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        User.age
        
        User.self.age
        
//        PhotoManager.shared.test(a: Int.self)
        
//        PhotoManager.shared.getATopic(api: .topic(id: "wallpapers"))
        
        
        //1. 타입 어노테이션으로 타입 명시
        PhotoManager.shared.example(api: .topic(id: "yd4daZHEtcA")) { (value: Topic) in
            print("통신 성공")
            dump(value)
        } failHandler: {
            print("통신 실패한 경우 alert")
        }
        
        //2. 매개변수에 T의 타입을 명시
        // - T.Type (= 메타 타입)
        PhotoManager.shared.example2(api: .randomPhoto, type: RandomPhoto.self) { value in
            print("통신 성공")
            dump(value)
        } failHandler: {
            print("통신 실패한 경우 alert")
        }


        var age: Int = 0
        var name: String = "고래밥"
        
        var test: String.Type = String.self

//        print(Dummy(mainContents: "24", subContents: "3536", others: 24))
//        print(Dummy(mainContents: 2, subContents: 24, others: 124))
        
//        let a = plus(a: "2", b: "22")
//        let b = plus(a: 3.2, b: 1.2)
//        print(a, b)
        
        
        
        //switch 구문에서 default가 필요하거나 필요하지 않은 이유
        //라이브러리나 프레임워크에서 만들어진 열거형의 모든 멤버(case)를 처리했음에도 불구하고 @unknown default를 써야 추후에 대한 대비를 할 수 있다.
//        let value = NSTextAlignment.center
        
//        switch value {
//        case .left:
//            <#code#>
//        case .right:
//            <#code#>
//        case .center:
//            <#code#>
//        case .justified:
//            <#code#>
//        case .natural:
//            <#code#>
//        @unknown default: //버전 이슈. 아직 @frozen이 아니라 추후 enum의 case가 늘어날 수 있으니, 추후 추가될. 즉, 아직 정의되지 않은 case가 늘어났을 때에 대한 대비
//            <#fatalError()#>
//        }
        
        
        
        
//        PhotoManager.shared.callUnsplashRequest(api: .randomPhoto)
//        PhotoManager.shared.callUnsplashRequest(api: .photo(query: "wallpapers"))
        
        //id: yd4daZHEtcA
//        PhotoManager.shared.getATopic(api: .photo(query: "wallpapers"))
        
        configureView()
    }
    
    func configureView() {
        view.addSubview(firstImageView)
        view.addSubview(secondImageView)
        view.addSubview(thirdImageView)
        view.addSubview(checkButton)
        
        view.backgroundColor = .white
        
        firstImageView.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        secondImageView.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.top.equalTo(firstImageView.snp.bottom).offset(10)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        thirdImageView.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.top.equalTo(secondImageView.snp.bottom).offset(10)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        checkButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.centerX.equalTo(firstImageView)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        checkButton.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
    }
    
    
    @objc
    func checkBtnTapped() {
        print(#function)
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
//
//        let group = DispatchGroup()
//        //아래 배열을 사용하면 index 값에 아래 코드 순서대로 들어간다는 보장이 없다.
////        var imageURLArr: [String] = []
//        let imageViewArr = [firstImageView, secondImageView, thirdImageView]
//        
//        group.enter()
//        PhotoManager.shared.getRandomPhoto(api: .randomPhoto){ result in
//            self.firstValue = result.urls.thumb
//            group.leave()
//        } failHandler: {
//            print("훈트워크 에러발생")
//            group.leave()
//        }
//        
//        group.enter()
//        PhotoManager.shared.getRandomPhoto(api: .randomPhoto) { result in
//            self.secondValue = result.urls.thumb
//            print(result.id)
//            group.leave()
//        } failHandler: {
//            print("훈트워크 에러발생")
//            group.leave()
//        }
//        
//        group.enter()
//        PhotoManager.shared.getRandomPhoto(api: .randomPhoto) { result in
//            self.thirdValue = result.urls.thumb
//            group.leave()
//        } failHandler: {
//            print("훈트워크 에러발생")
//            group.leave()
//        }
//        
//        //끝나는 지점은 장담할 수 없음. 3 1 2, 1 2.  그럼에도 세 통신이 모두 완료 되었다는 신호는 받을 수 있음.
//        //네트워크 통신이 느릴 때 테스트할 수 있는 방법? Network condition
//        //. -> xcode - window - device and simulator
//        group.notify(queue: .main) {
//            //메인스레드에서 동작하고 있는지 확인할 수 있는 코드
//            print(Thread.isMainThread) //true: 메인스레드에서 동작하는 코드
//            
//            self.firstImageView.kf.setImage(with: URL(string: self.firstValue))
//            self.secondImageView.kf.setImage(with: URL(string: self.firstValue))
//            self.thirdImageView.kf.setImage(with: URL(string: self.firstValue))
//            
//            print("3개 다 끝났다!")
//        }
    }
    
}
