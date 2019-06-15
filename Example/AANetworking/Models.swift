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


// MARK: - Model1
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


// MARK: - Model2
struct Model2: Codable {
    let pantoneValue: String
    let id: Int
    let name: String
    let year: Int
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case pantoneValue = "pantone_value"
        case id, name, year, color
    }
}


// MARK: - Model3
struct Model3: Codable {
    let email, password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
