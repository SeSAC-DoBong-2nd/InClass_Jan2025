//
//  KakaoAPIResponseModel.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/15/25.
//

import Foundation

struct KakaoAPIResponseModel: Decodable {
    let documents: [Documents]
}

struct Documents: Decodable {
    let contents: String
    let price: Int
    let title: String
    let thumbnail: String
}
