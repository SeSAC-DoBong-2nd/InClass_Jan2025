//
//  Dummy.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/22/25.
//

import Foundation

//추가 공부 키워드: generic parameter pack

//U: upercased - 별 의미 없음
struct Dummy<T, U: Numeric> {
    let mainContents: T
    let subContents: T
    let others: U
}
