//
//  RandomViewController.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/14/25.
//

import UIKit

import SnapKit
import Alamofire
import Kingfisher

struct UserAPIResponse: Decodable {
    let results: [UserDatail]
    //    let info: Info
}

struct UserDatail: Decodable {
    let gender: String
    let email: String
    let name: UserName
}

struct UserName: Decodable {
    let first: String
    let last: String
}

struct LottoAPIResponse: Decodable {
    let drwNoDate: String
    let firstWinamnt: Int
}

struct DogAPIResponse: Decodable {
    let message: String
    let status: String
}

protocol ViewConfiguration: AnyObject {
    func setHierarchy() //addSubView 담당
    func setLayout() //SnapKit Layout 담당
    func setStyle() //UI Property 스타일 속성 담당
}

class RandomViewController: UIViewController, ViewConfiguration {
    
    let dogImageView = UIImageView()
    let nameLabel = UILabel()
    let randomButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    func setHierarchy() {
        view.addSubview(dogImageView)
        view.addSubview(nameLabel)
        view.addSubview(randomButton)
    }
    
    func setLayout() {
        dogImageView.snp.makeConstraints {
            $0.size.equalTo(300)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        nameLabel.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(dogImageView.snp.bottom).offset(20)
        }
        
        randomButton.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        randomButton.snp_height
    }
    
    func setStyle() {
        dogImageView.backgroundColor = .red
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 12)
        randomButton.backgroundColor = .yellow
        randomButton.addTarget(self,
                               action: #selector(userButtonTapped),
                               for: .touchUpInside)
    }
    
    //왜 print 순서가 1 2 3 4가 아닌 1 4 2 3 순 ???
    //네트워크 통신은 오래걸릴 수 있는 가능성이 있어 비동기 처리한다.
    @objc
    func randomBtnTapped() {
        print("======11111======")
        
        // 버튼 누르면 램덤으로 강아지 나오게
        // 크롬에서 엔터키 눌렀을 때와 같이 요청하는 부분
        let url = "https://dog.ceo/api/breeds/image/random"
        
        //responseDecodable: 응답이 잘못된 것도 실패이고, 식판에 안 담겨도 실패이다.
        //이럴 때에는 responseString: 식판이랑 상관없이 응답이 잘 오고있는지 확인!
        AF.request(url, method: .get).responseDecodable(of: DogAPIResponse.self) { response in
            
            print("======22222======")
            
            switch response.result {
                
                //응답, 식판 둘 다 문제 없다. => 구조체를 활용할 수 있다.
            case .success(let value):
                print("success")
                self.nameLabel.text = value.message
                DispatchQueue.main.async {
                    self.dogImageView.kf.setImage(with: URL(string: value.message))
                }
                
                
                //응답은 잘 왔으나, decodable한 내용을 담는 Response Struct가 이상한 경우에도 error가 발생
            case .failure(let error):
                print("error")
                print(error)
                
            }
            print("======33333======")
        }
        
        print("======44444======")
    }
    
    
    @objc
    func lottoButtonTapped() {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(Int.random(in: (1000...1154)))"
        
        AF.request(url, method: .get)
            .responseDecodable(of: LottoAPIResponse.self) { response in
                switch response.result {
                    
                    //응답, 식판 둘 다 문제 없다. => 구조체를 활용할 수 있다.
                case .success(let value):
                    print("success")
                    self.nameLabel.text = "\(value.drwNoDate) : \(value.firstWinamnt.formatted())원"
                    
                    //응답은 잘 왔으나, decodable한 내용을 담는 Response Struct가 이상한 경우에도 error가 발생
                case .failure(let error):
                    print("error")
                    print(error)
                    
                }
            }
    }
    
    @objc
    func userButtonTapped() {
        let url = "https://randomuser.me/api/?results=10"
        
        AF.request(url, method: .get).responseDecodable(of: UserAPIResponse.self) { response in
            switch response.result {
                
                //응답, 식판 둘 다 문제 없다. => 구조체를 활용할 수 있다.
            case .success(let value):
                print("success")
                let gender = value.results[0].gender
                let name = value.results[0].name.last + " " + value.results[0].name.first
                self.nameLabel.text = "나는 \(gender)이고, 이름은 \(name)이야!"
                
                //응답은 잘 왔으나, decodable한 내용을 담는 Response Struct가 이상한 경우에도 error가 발생
            case .failure(let error):
                print("error")
                print(error)
                
            }
            
        }
    }
    
}

