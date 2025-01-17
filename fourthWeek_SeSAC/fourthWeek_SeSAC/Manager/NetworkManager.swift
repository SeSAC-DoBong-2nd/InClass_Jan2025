//
//  NetworkManager.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/16/25.
//

import Foundation

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func callKakaoBookAPI(query: String, page: Int, completionHandler: @escaping (KakaoAPIResponseModel) -> Void) {
        let url = "https://dapi.kakao.com/v3/search/book"
        
        print(#function, url)
        
        let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakaoRestAPIKey)"]
        
        AF.request(url,
                   method: .get,
                   parameters: ["query": query, "size": 20, "page": page],
                   headers: header)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: KakaoAPIResponseModel.self)
        { response in
            
            switch response.result {
                
            case .success(let result):
                print("success")
                dump(result.documents)
                completionHandler(result)
                
            case .failure(let error):
                print("failure")
                print(error)
            }
            
        }
    }
    
    func randomUser(completionHandler: @escaping (String) -> (Void)) {
        print("randomUser1")
        let url = "https://randomuser.me/api/?results=10"
        
        AF.request(url, method: .get).responseDecodable(of: UserAPIResponse.self) { response in
            switch response.result {
                
                //응답, 식판 둘 다 문제 없다. => 구조체를 활용할 수 있다.
            case .success(let value):
//                let gender = value.results[0].gender
//                let name = value.results[0].name.last + " " + value.results[0].name.first
//                self.nameLabel.text = "나는 \(gender)이고, 이름은 \(name)이야!"
                
                print("success", value.results[0].name.last)
                let result = value.results[0].name.last
                
                print("randomUser2")
                completionHandler(result)
                print("randomUser3")
                
                //응답은 잘 왔으나, decodable한 내용을 담는 Response Struct가 이상한 경우에도 error가 발생
            case .failure(let error):
                print("error")
                print(error)
            }
            
        }
        
        print("randomUser4")
    }
    
}
