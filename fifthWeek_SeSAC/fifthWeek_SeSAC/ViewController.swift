//
//  ViewController.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/20/25.
//

import UIKit

import SnapKit

/*
 1. GCD vs swift Concurrency
 - GCD: sync/async/serial/concurrent -> dispatchgroup
 2. url 관리 ? AF.request 관리 ? => router pattern
 */

class ViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        //        serialSync()
        //        concurrentSync()
        //        concurrentAsync()
        //        example()
        //        concurrentAsync()
        example2()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {
            print(#function)
        }
        //        serialAsync()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            print(#function)
        }
    }
    
    
    //serial = 직렬, sync = 동기
    func serialSync() {
        print("START!", terminator: " ")
        
        for i in 1...100 {
            print(i, terminator: " ")
        }
        
        //무한 대기 상태. 교착상태
        //        DispatchQueue.main.sync {
        for i in 101...200 {
            print(i, terminator: " ")
        }
        //        }
        
        print("END", terminator: " ")
    }
    
    func serialAsync() {
        print("START!", terminator: " ")
        
        DispatchQueue.main.async {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        
        for i in 101...200 {
            print(i, terminator: " ")
        }
        
        print("END", terminator: " ")
    }
    
    func concurrentSync() {
        print("START!", terminator: " ")
        
        DispatchQueue.global().sync {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        for i in 101...200 {
            print(i, terminator: " ")
        }
        
        print("END", terminator: " ")
    }
    
    func concurrentAsync() {
        print("START!", terminator: " ")
        
        DispatchQueue.global().async {
            for i in 1...100 {
                
                print(i, terminator: " ")
                
            }
        }
        
        for i in 101...200 {
            print(i, terminator: " ")
        }
        
        print("END", terminator: " ")
    }
    
    func example() {
        print("EXAMPLE START")
        //qos: QualityOfService
        //  - concurrent에만 있다, global.
        //    - main 절대 없는데 왜 없냐? main은 UI담당 스레드. 즉, 사용자와 가장 맞닿아있어서 항상 빨리빨리 끝내야하기 때문에
        //  - 다 동시에 시작하되, 이건 제일 빨리 끝났으면 할 때 설정
        //  - userInteractive가 최우선순위
        DispatchQueue.global(qos: .userInteractive).async {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        print("===111===")
        
        //  - background가 최하순위
        DispatchQueue.global(qos: .background).async {
            for i in 101...200 {
                print(i, terminator: " ")
            }
        }
        print("===222===")
        
        DispatchQueue.global().async {
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        print("EXAMPLE END")
    }
    
    //DispatchGroup
    func example2() {
        print("EXAMPLE START")
        
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        print("===111===")
        
        DispatchQueue.global().async(group: group) {
            for i in 101...200 {
                print(i, terminator: " ")
            }
        }
        print("===222===")
        
        DispatchQueue.global().async(group: group) {
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        
        //queue: notify 신호를 받을건데 어디 스레드에서 받을래?
        // - 보틍 UI가 바뀌기 때문에 main 스레드에서 받음
        group.notify(queue: .main) {
            print("알바생 3명 task 종료 신호 받음!")
        }
        
        print("EXAMPLE END")
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
        
        /*
         작업이 빠르게 끝날 수 있음.
         실행하는 여러 작업이 모두 종료되었다는 신호를 받기가 어렵다.
         task의 제각각 종료 신호는 가능.
         */
        //        print(#function)
        //        NetworkManager.shared.fetchImage { image in
        //            print("firstImageView Succesed")
        //            self.firstImageView.image = image
        //            print("firstImageView 끝")
        //        }
        //
        //        NetworkManager.shared.fetchImage { image in
        //            print("secondImageView Succesed")
        //            self.secondImageView.image = image
        //            print("firstImageView 끝")
        //        }
        //
        //        NetworkManager.shared.fetchImage { image in
        //            print("thirdImageView Succesed")
        //            self.thirdImageView.image = image
        //            print("firstImageView 끝")
        //        }
        
        
        /*
         작업은 오래 걸리지만, 끝나는 시점을 알 수 있음
         */
        // => dispathGroup 사용으로 해결
        
        let group = DispatchGroup()
        group.enter() // += 1
        
        print(#function)
        
        NetworkManager.shared.fetchImage { image in
            print("firstImageView Succesed")
            group.leave() // -= 1
        }
        
        group.enter() // += 1
        NetworkManager.shared.fetchImage { image in
            print("secondImageView Succesed")
            group.leave() // -= 1
        }
        
        group.enter() // += 1
        NetworkManager.shared.fetchImage { image in
            print("thirdImageView Succesed")
            group.leave() // -= 1
        }
        
        //notify = 동기코드이다 위ㅊ
        group.notify(queue: .main) {
            print("group.notify 출력!")
        }
        
        print(#function, "end")
    }
    
    //    @objc
    //    func checkBtnTapped() {
    //        print(#function)
    //        //https://picsum.photos/200/200
    //        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/sombrero_spitzer_3000.jpg")!
    //
    //        //다른 알바생 담당: 네트워크 통신, 파일 다운로드
    //        DispatchQueue.global().async {
    //            //Data(contentsOf: url) = 동기 타입 따라서 이게 수행되는 동안 UI 반응 x
    //            if let data = try? Data(contentsOf: url) {
    //                if let image = UIImage(data: data) {
    //                    DispatchQueue.main.async {
    //                        self.firstImageView.image = image
    //                    }
    //
    //                }
    //            }
    //        }
    //    }
    
}



/*
 1. func exam: global async면 다른 메서드에 곧 바로 시작시킬텐데, 왜 main의 print가 다 찍힐 때 까지 실행되지 않고 있다가 다 끝나고 나서 시작하지?
   - 지금은 동기 코드가 너무 짧아서 그런 거임~
 */
