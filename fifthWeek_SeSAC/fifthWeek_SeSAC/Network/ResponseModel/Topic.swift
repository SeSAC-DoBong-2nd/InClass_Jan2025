//
//  Topic.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/21/25.
//

import Foundation

struct Topic: Decodable {
    let title: String
    let description: String
    let total_photos: Int
    let cover_photo: TopicCoverPhoto
}

struct TopicCoverPhoto: Decodable {
    let urls: TopicURL
}

struct TopicURL: Decodable {
    let thumb: String
}
