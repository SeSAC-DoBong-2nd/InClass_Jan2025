//
//  TenViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

//왜 'TenViewController' Class에서는 cellForRowAt이 안 나올까?
  //테이블뷰 아웃렛 연결
  //테이블뷰를 만들 때 필요한 것들이 있는데.. 이걸. 수동으로 다 해주어야 한다.
// -> 프로토콜 델리게이트

/*
 1. 테이블뷰 이름!
 2. 테이블뷰 부하직원! (프로토콜) UITableViewDelegate, UITableViewDataSource
 3. 필수 func 기능 2개 구현하기
 4. 테이블뷰와 부하직원이 서로 인지할 수 있도록 연결하는 코드 작성 (= 타입으로서의 프로토콜, Protocol as Type)
 */
class TenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Xib cell 추가할 경우 사용해야하는 코드
        let xib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "NoProfileTableViewCell")
        
        //4. 테이블뷰와 부하직원이 서로 인지할 수 있도록 연결하는 코드 작성
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell") as! NoProfileTableViewCell
        
        return cell
    }

}
