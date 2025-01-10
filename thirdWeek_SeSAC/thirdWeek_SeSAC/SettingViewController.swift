//
//  SettingViewController.swift
//  thirdWeek_SeSAC
//
//  Created by 박신영 on 1/10/25.
//

import UIKit

//struct와 enum 필요시 선택 구분법
//1) 인스턴스 생성 여부: 클래스/구조체 - 인스턴스 O, 열거형 - 인스턴스 X
//    - 열거형에서는 그러면.. 인스턴스 프로퍼티를 사용할 수 없겠군!
//2) Setting 구조체의 인스턴스 생성만 막아준다면 struct를 그냥 쓰면 되는거 아니야?
//   - 구조체에 private init()을 설정해준다면 열거형과 동일
//3) 그럼에도 어떨 때 열거형을 굳이 사용해야하나? => 가지고있는 데이터의 '고유성', '유일성', 메모리
//   - 즉 case별 데이터가 유일성을 지니며 다 달라야할 때 (unique)

struct Setting {
    static let personal = "개인 설정"
    
    private init() {}
}

//멤버와 값을 분리 => rawValue
//CaseIterable => case를 배열로 표현해줄 수 있음 (= allCase)
enum SettingOptions: Int, CaseIterable {
    //타입 프로퍼티는 생성 가능
    static let name = "케케몬"
    
    case total
    case personal
    case others
    
    var mainOption: String {
        switch self {
        case .total:
            return "전체설정"
        case .personal:
            return "개인설정"
        case .others:
            return "고객센터"
        }
    }
    
    var subOption: [String] {
        switch self {
        case .total:
            return ["공지사항1", "실험실1", "버전정보1"]
        case .personal:
            return ["공지사항2", "실험실2", "버전정보2"]
        case .others:
            return ["공지사항3", "실험실3"]
        }
    }
    
}

class SettingViewController: UIViewController {
    
    let sectionList: [SettingOptions] = SettingOptions.allCases
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(SettingOptions.personal)
        print(SettingOptions.personal.rawValue)
        
        print(Setting.personal)
        
        print(SettingOptions.total.mainOption)
        
        print(SettingOptions.allCases[0].subOption[2]) //버전 정보

        tableView.delegate = self
        tableView.dataSource = self
        
        let label = UILabel()
        label.textAlignment = .center
    }
    
}

extension SettingViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
}

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionList[section].subOption.count
        // == return SettingOptions.allCases[section].subOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOption[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOption
    }
    
}
