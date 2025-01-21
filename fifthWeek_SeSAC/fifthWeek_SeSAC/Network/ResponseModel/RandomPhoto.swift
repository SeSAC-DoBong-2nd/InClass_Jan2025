//
//  RandomPhoto.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/21/25.
//

struct RandomPhoto: Decodable {
    let id: String
    let width: Int
    let height: Int
    let urls: RandomPhotoURL
}

struct RandomPhotoURL: Decodable {
    let thumb: String
}
