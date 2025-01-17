//
//  ImageZoomViewController.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/17/25.
//

import UIKit

import SnapKit

class ImageZoomViewController: UIViewController {
    
    private lazy var scrollView = {
        let view = UIScrollView()
        view.backgroundColor = .green
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.maximumZoomScale = 5 //최대 줌(배수)
        view.minimumZoomScale = 1 //최소 줌(배수)
        view.bouncesVertically = false //스크롤뷰 수직 끝에 도달했을 때 bounces 효과 줄지 말지
        
        view.delegate = self
        
        return view
    }()
    
    private let imageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .yellow
        view.image = UIImage(systemName: "star")
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        scrollView.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.center.equalTo(view)
        }
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(scrollView)
        }
        
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(doubleTapGesture))
        tap.numberOfTapsRequired = 2 //탭한 횟수
        imageView.addGestureRecognizer(tap)
    }
    
    //사진이
    //1배율 -> 3배율
    //1배율 이상 -> 다시 1배율
    @objc
    func doubleTapGesture() {
        if scrollView.zoomScale == 1{
            scrollView.setZoomScale(3, animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
    
}

extension ImageZoomViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        
        return imageView
    }
    
}
