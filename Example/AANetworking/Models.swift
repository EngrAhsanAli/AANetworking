//
//  Models.swift
//  AANetworking_Example
//
//  Created by Ahsan ALI on 28/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

// These classes was generated from JSON Schema using quicktype
// https://reqres.in/


// MARK: - Welcome
struct Model1: Codable {
    let page, perPage, total: Int
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
    }
}


