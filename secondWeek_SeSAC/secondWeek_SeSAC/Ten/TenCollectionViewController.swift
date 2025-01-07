//
//  TenCollectionViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

/**
 1. collectionView 프로퍼티 생성
 2. 부하직원: UICollectionViewDelegate, UICollectionViewDataSource
 3. 필수메서드 선언
 4. 연결 (delegate self)
 */

class TenCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let xib = UINib(nibName: "TenCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "TenCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 30 //가로 간격
        layout.minimumLineSpacing = 10 //세로 간격
        layout.sectionInset = UIEdgeInsets(top: 100, left: 30, bottom: 100, right: 30)
        
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TenCollectionViewCell", for: indexPath) as! TenCollectionViewCell
        
        return cell
    }

}
