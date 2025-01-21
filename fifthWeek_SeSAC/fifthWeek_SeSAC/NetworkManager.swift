//
//  NetworkManager.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/20/25.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let url = URL(string: "https://picsum.photos/200/200")!
    
    private init() {}
    
    func fetchImage(complitionHandler: @escaping (UIImage) -> Void) {
        DispatchQueue.global().async {
            //Data(contentsOf: url) = 동기 타입 따라서 이게 수행되는 동안 UI 반응 x
            if let data = try? Data(contentsOf: NetworkManager.url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        ViewController.group.leave()
                        complitionHandler(image)
                    }
                }
            }
        }
    }
    
}
