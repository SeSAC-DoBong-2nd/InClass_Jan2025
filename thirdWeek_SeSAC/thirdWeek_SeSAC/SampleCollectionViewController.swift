//
//  SampleCollectionViewController.swift
//  thirdWeek_SeSAC
//
//  Created by 박신영 on 1/9/25.
//

import UIKit

struct Mentor {
    let name: String
    let age: String
}

class SampleCollectionViewController: UIViewController {

    //전체 데이터
    var totalList: [Int] = Array(1...100)
    
    //필터링된 데이터
    lazy var list: [Int] = totalList
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var listCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = Mentor(name: "2", age: "4")

        setRegister()
        setUI()
        setLayout()
        
        searchBar.tintColor = .red
        
        print(1)
        //viewWillAppear 이후에 2가 출력됨
        DispatchQueue.main.async {
            print(2)
        }
        print(3)
        print(4)
        
//        let t = 30+2 |> 30+4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    func setRegister() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        let id = SampleCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        bannerCollectionView.register(xib, forCellWithReuseIdentifier: id)
        
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        
        listCollectionView.register(xib, forCellWithReuseIdentifier: id)
        
        searchBar.delegate = self
    }
    
    func setUI() {
        bannerCollectionView.backgroundColor = .black
        bannerCollectionView.showsHorizontalScrollIndicator = false
        
        //scrollView안에서 동작하는 cell을 페이지로 인식해서 페이지 단위로 동작
        bannerCollectionView.isPagingEnabled = true
    }
    
    func setLayout() {
        //UIScreen.main.bounds.width (추후 사라짐)
        //view.window?.windowScene?.screen.bounds.width (새로운 방법)
        
        bannerCollectionView.collectionViewLayout = configureCollectionViewLayout()
        configureListCollectionViewLayout()
    }
    
    func configureListCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let sectionInset: CGFloat = 16
        let cellSpacing: CGFloat = 16
        let useAbleWidth = UIScreen.main.bounds.width - (sectionInset * 2 + cellSpacing * 3)
        
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: 10, left: sectionInset, bottom: 10, right: sectionInset)
        layout.itemSize = CGSize(width: useAbleWidth/4, height: useAbleWidth/4 * 1.2)
        
        listCollectionView.collectionViewLayout = layout
    }

}

//MARK: - UISearchBarDelegate
extension SampleCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        view.endEditing(true)
        //searchBar.showsCancelButton = false
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
        //searchBar.showsCancelButton = true
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        
        var result = [Int]()
        if searchText.count == 0 {
            //전제 데이터 가져오도록
            result = totalList
        } else {
            for i in list {
                if i == Int(searchText) ?? 0 {
                    result.append(i)
                }
            }
        }
        list = result
        listCollectionView.reloadData()
    }
    
}

//MARK: - UICollectionViewDelegate
extension SampleCollectionViewController: UICollectionViewDelegate { }

//MARK: - UICollectionViewDataSource
extension SampleCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleCollectionViewCell.identifier, for: indexPath) as! SampleCollectionViewCell
        
        cell.backgroundColor = .cyan
        cell.imageView.backgroundColor = .white
        
        //View Drawing Cycle
//        cell.imageView.layer.cornerRadius = cell.imageView.frame.width / 2
        
        
        //코드가 화면에 그려지는 시점 변환
        //GCD
        DispatchQueue.main.async {
            cell.imageView.layer.cornerRadius = cell.imageView.frame.width / 2
        }
        
        cell.titleLabel.text = "\(list[indexPath.item])"
        
        return cell
    }
    
}
