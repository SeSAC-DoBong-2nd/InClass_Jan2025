//
//  BookView.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/16/25.
//

import UIKit

import SnapKit

class BookView: BaseView {
    
    lazy var collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            BookCollectionViewCell.self,
            forCellWithReuseIdentifier: BookCollectionViewCell.identifier
        )
        return collectionView
    }()
    
    override func configureHierarchy() {
        self.addSubview(collectionView)
    }
    
    override func configureLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func configureView() {
        self.backgroundColor = .white
    }
    
//    func createCollectionView() -> UICollectionView
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical
        
        return layout
    }
    
}

extension BookView: UICollectionViewDelegate {
    
}

extension BookView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as! BookCollectionViewCell
//        cell.bookCoverImageView.image = UIImage(systemName: "star")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        let vc = KakaoBookSearchViewController()
    }
    
}

