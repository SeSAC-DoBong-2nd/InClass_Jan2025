//
//  MarketViewController.swift
//  SeSACFourthWeek
//
//  Created by Jack on 1/14/25.
//

import UIKit

import Alamofire
import SnapKit

class MarketViewController: UIViewController {
 
    let tableView = UITableView()
    
    var list: [MarketAPIResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureTableView()
        getMarketAPI()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.backgroundColor = .white
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.id)
    }
    
    func configureView() {
        view.backgroundColor = .white
    }

}

extension MarketViewController {
    
    func getMarketAPI() {
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url,
                   method: .get,
                   parameters: ["is_details": true])
        .validate(statusCode: 200..<300)
        .responseDecodable(of: [MarketAPIResponseModel].self)
        { response in
            
            switch response.result {
                
            case .success(let value):
                print("success")
                dump(value)
                self.list = value
                self.tableView.reloadData()
                
            case .failure(let error):
                print("failure")
                print(error)
            }
            
        }
    }
    
}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function, list.count)
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.id, for: indexPath) as? MarketTableViewCell else { return UITableViewCell() }
        
        let data = list[indexPath.row]
        
        cell.nameLabel.text = data.korean
        
        return cell
    }
    
}
