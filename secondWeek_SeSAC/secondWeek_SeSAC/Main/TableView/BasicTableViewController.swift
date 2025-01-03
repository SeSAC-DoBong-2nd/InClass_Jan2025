//
//  BasicTableViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {
    
    var list = ["프로젝트", "메인 업무", "새싹 과제"] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //tableView.allowsSelection: 테이블 뷰에 관한 isUserInteraction 느낌의 값
        
        //모든 cell의 크기가 동일하다면 아래 코드 처럼 한번에 cell의 높이를 정의하 수월함
        tableView.rowHeight = 80
        
//        var moster = Monster() //초기화를 하여 인스턴스를 만들었다 라고 함.
    }
    
    
    
    //섹션을 여러개 쓰지 않는 이상 해당 메서드는 잘 안 씀
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        <#code#>
//    }
    
    //1. 셀의 개수: numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    
    //2. 셀 디자인 및 데이터 처리: cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell의 반환타입이 uitableviewcell?이고, identifier가 잘못됐으면 당연히 nil값을 반환하기에 아래 cell?. 으로 쓰이는 것.
        //따라서 identifier가 무조건 맞다면 강제 언래핑 ! 을 사용해도 됨
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "psycell") else {
//            print("error cell")
//            return UITableViewCell()
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "psyCell")!
        
//        if indexPath.row == 0 {
//            cell.textLabel?.text = list[indexPath.row]
//        } else if indexPath.row == 1 {
//            cell.textLabel?.text = list[indexPath.row]
//        } else if indexPath.row == 2 {
//            cell.textLabel?.text = list[indexPath.row]
//        } else {
//            cell.textLabel?.text = "Error"
//        }
        cell.textLabel?.text = list[indexPath.row]
        //위 주석처리 된 조건문의 번거로움을 바로 해결하고자 해당 코드가 등장
        //이는 indexPath.row가 각 cell의 index 값을 나타내는 것을 활용한 것
        
        cell.textLabel?.textColor = .blue
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        cell.detailTextLabel?.setPrimaryLabel("디테일 텍스트 레이블")
        //cell.detailTextLabel?까지 가져오는 이유는 UILabel을 확장하였으니 UILabel 프로퍼티가 있어야 .setPrimaryLabel() 함수를 쓸 수 있기 때문.

        
        cell.imageView?.image = UIImage(systemName: "folder")
        
        //상위 4개 cell만 lightgray
//        if indexPath.row <= 3 {
//            cell.backgroundColor = .lightGray
//        } else {
//            cell.backgroundColor = .white
//        }
        
        //횡단보도 if else
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = .darkGray
//        } else {
//            cell.backgroundColor = .white
//        }
        //횡단보도 삼항 연산자
        cell.backgroundColor = indexPath.row % 2 == 0 ?
            .lightGray : .white
        
        
        print(#function, indexPath)
        
        return cell
    }
    
    //3. 셀의 높이: heightForRowAt
    //tableView.rowHeight = 80 값으로 대체했음
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print(#function)
//        return 80.2
//    }
    
    //cell이 클릭됐을 때 실행되는 함수
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath.row)
        
        list.remove(at: indexPath.row)
        
        //테이블뷰 관련 데이터가 변경될 때는 무조건 reloadData가 따라온다.
        tableView.reloadData()
    }
    
    @IBAction
    func randomTextTapped(_ sender: UIBarButtonItem) {
        sender.isEnabled = false //중복 클릭 방지
        //버튼 눌렀을 때 cell에 새로운 값들 추가 시키기
        let random = ["장보기", "영화보기", "쇼핑하기", "맛집탐방", "산책하기"]
        self.list.append(random.randomElement() ?? "")
        
        //뷰와 데이터는 따로 놀아서, 늘 잘 맞춰줘야 한다.
        tableView.reloadData() //테이블 뷰의 데이터가 바뀌었으니 새로 그려라! 라는 메서드
        
        sender.isEnabled = true //중복 클릭 방지 해제
    }
    
}
