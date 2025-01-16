//
//  KakaoAPIResponseModel.swift
//  fourthWeek_SeSAC
//
//  Created by 박신영 on 1/15/25.
//

import Foundation

struct KakaoAPIResponseModel: Decodable {
    let documents: [Documents]
    let meta: Metas
}

struct Documents: Decodable {
    let contents: String
    let price: Int
    let title: String
    let thumbnail: String
}

struct Metas: Decodable {
    let is_end: Bool
}
