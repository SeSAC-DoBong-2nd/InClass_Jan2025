//
//  VerticalScrollViewController.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/17/25.
//

import UIKit

import SnapKit

class VerticalScrollViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let imageView = UIImageView()
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        configureLayout()
        configureContentView()
    }
    
    func configureLayout() {
        scrollView.backgroundColor = .lightGray
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
//            $0.edges.equalTo(scrollView) 사용하면 안되는 이유 아래에 정리
            $0.width.equalTo(scrollView.snp.width)
            $0.verticalEdges.equalTo(scrollView) //스크롤 뷰 안에 content영역
        }
    }
    
    func configureContentView() {
        contentView.backgroundColor = .red
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.addSubview(button)
        
        label.backgroundColor = .orange
        imageView.backgroundColor = .black
        button.backgroundColor = .purple
        
        label.text = "훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이훈케이"
        label.numberOfLines = 0
        
        label.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        button.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.top.equalTo(label.snp.bottom).offset(50)
            make.bottom.equalTo(imageView.snp.top).offset(-50)
        }
        
        imageView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(1200)
        }
        
    }
    
}

//label과 button은 안의 요소에 따라 기본적인 높이가 있는 것으로 알고있는데 스크롤 뷰 속 contentview 레이아웃을 잡을 때 label과 button은 따로 레이아웃을 지정해두지 않아도 안에 다른 요소들의 높이가 정해져있다면 스크롤뷰가 정상 작동할까요?
  //- 네 정상 작동 합니다.

// ? : 왜 contentView의 width를 horizontal로 하면 안될까?
  // -  contentView 아이템의 witdh 값이 무한대로 늘어난다면 스크롤뷰 역시 가로 영역을 그만큼 가져가기에 아이폰 화면을 넘어서는 상황이 발생한다.
  // - 혹은 아이템의 값이 하나도 적용되지 않았다면 contentView의 width 값이 명시되지 않아 아이템의 width를 기준으로 잡혔고 완전히 줄어들게 되어 사진과 같은 상황이 발생하는 것이다.
