//
//  MarketAPIResponseModel.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/15/25.
//

import Foundation

/**
 서버에서 키를 바꾸면 앱이 터진다. => DecodingStrategy(=디코딩전략)
 - 옵셔널을 통한 해결
 - CodingKey:
     서버 - 식판
     서버에서 오는 값과 내가 만든 식판을 연결
 */

import Foundation

struct MarketAPIResponseModel: Decodable {
    let market: String
    let name: String?
    let korean: String
    let english: String?
    
    enum CodingKeys: String, CodingKey {
        case market
        case name
        case korean = "korean_name"
        case english = "english_name"
    }
}
