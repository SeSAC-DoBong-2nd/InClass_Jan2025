//
//  PhotoManager.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/21/25.
//

import Foundation

import Alamofire

//열거형 - @frozen, @unknown ==> 인투디언노운
//  - 위 어트리뷰트 키워드가 쓰인 열거형 케이스가 앞으로 추가될 일이 절대 발생하지 않으면 frozen 시킨다.
//@frozen >>> 컴파일 최적화에 조금 도움됨, but 내 프로젝트 상이 아닌 라이브러리 파일을 만들 때 쓰여야한다. == Frozen Enumeration
//  Unfrozen Enumeration (= case가 늘어날 수 있는 요소들. 즉, 대부분의 열거형)

// 열거형 연관값 (= Associated Value)
// -> case에서 매개변수로 활용하는 것
// => Moya, Alamofire 에서 URLRequestConvertible 을 지원함
enum UnsplashRequest {
    case randomPhoto
    case topic(id: String)
    case photo(query: String)
}

extension UnsplashRequest {
    
    var baseURL: String {
        return "https://api.unsplash.com/"
    }
    
    var endPoint: URL {
        switch self {
        case .randomPhoto:
            return URL(string: baseURL + "photos/random")!
        case .topic(let id):
            return URL(string: baseURL + "topics/\(id)")!
        case .photo(let query):
            return URL(string: baseURL + "photos/\(query)")!
        }
    }
    
    //추후 모든 case 경우로 변환
    var parameter: Parameters {
        return ["page": "1",
                "color": "white",
                "order_by": "relevant"]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: HTTPHeaders {
        return ["Authorization": "Client-ID \(Key.unsplash)"]
    }
    
}

class PhotoManager {
    
    //(메타)타입 프로퍼티
    static let shared = PhotoManager()
    
    private init() { }
    
    func getRandomPhoto(api: UnsplashRequest,
                        complitionHanlder: @escaping (RandomPhoto) -> Void,
                        failHandler: @escaping () -> Void) {
        // parameters: 무조건 쿼리스트링에 들어가는 것은 아님!
        // -> querystring or HTTP Body
        AF.request(api.endPoint,
                   method: api.method,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: RandomPhoto.self) { response in
                switch response.result {
                case .success(let value):
                    print(value)
                    complitionHanlder(value)
                case .failure(let error):
                    print(error)
                    failHandler()
                }
            }
    }
    
    func callUnsplashRequest(api: UnsplashRequest) {
        AF.request(api.endPoint, method: api.method, headers: api.header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: RandomPhoto.self) { response in
                switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getATopic(api: UnsplashRequest) {
        AF.request(api.endPoint, method: api.method, headers: api.header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: Topic.self) { response in
                debugPrint(response)
                switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error)
                }
                
            }
    }
    
    func example<T: Decodable>(api: UnsplashRequest,
                               successHandler: @escaping (T) -> Void,
                               failHandler: @escaping () -> Void) {
        AF.request(api.endPoint, method: api.method, headers: api.header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: T.self) { response in
                debugPrint(response)
                print("response!!!: \n \(response)")
                switch response.result {
                case .success(let value):
                    print(value)
                    successHandler(value)
                case .failure(let error):
                    print(error)
                    failHandler()
                }
                
            }
    }
    
    func example2<T: Decodable>(api: UnsplashRequest,
                                type: T.Type,
                               successHandler: @escaping (T) -> Void,
                               failHandler: @escaping () -> Void) {
        AF.request(api.endPoint, method: api.method, headers: api.header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: T.self) { response in
                debugPrint(response)
                print("response!!!: \n \(response)")
                switch response.result {
                case .success(let value):
                    print(value)
                    successHandler(value)
                case .failure(let error):
                    print(error)
                    failHandler()
                }
                
            }
    }
    
    func test(a: Int.Type) {
        print(a)
    }
    
}
