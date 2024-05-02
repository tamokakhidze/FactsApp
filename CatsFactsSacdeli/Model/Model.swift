//
//  Model.swift
//  CatsFactsSacdeli
//
//  Created by Tamuna Kakhidze on 01.05.24.
//

import Foundation

struct Facts: Decodable {
    var fact: String
    var length: Int
}

struct FactsInfo: Decodable {
    var data: [Facts]
}
