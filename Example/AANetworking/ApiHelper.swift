//
//  ApiHelper.swift
//  AANetworking_Example
//
//  Created by MacBook Pro on 08/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import AANetworking

enum Api {
    
    case moive(String)
}

extension Api: AANetwork_TargetType {
    func onRequest() {
        showProgressDialog("Loading")
    }
    
    func onResponse() {
        hideProgressDialog()
    }
    
    func onError(error: AANetwork_Error) {
        showProblem(error.localizedDescription)
    }
    
    var responseType: AANetwork_ResponseType {
        switch self {
        case .moive:
            return .object
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://api.douban.com")!
    }
    
    var path: String {
        switch self {
            
        case let .moive(id):
            return "v2/movie/subject/\(id)"
        }
    }
    
    var method: AANetwork_Method {
        switch self {
            
        case .moive(_):
            return .get
        }
//        return .post
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: AANetwork_Task {
        switch self {
            
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}

struct Movie: Codable {
    
    var rating: Rating
    var images: Images
    
    var reviews_count: Int
    var wish_count: Int
    var year: String
    var summary: String
    var comments_count: Int
    var ratings_count: Int
    var collect_count: Int
    
    var countries: [String]
    var genres: [String]
    var aka: [String]
    
    var casts: [Person]
    var directors: [Person]
}

struct Rating: Codable {
    
    var max: Float
    var min: Float
    var average: Float
    var stars: String
}

struct Images: Codable {
    
    var small: String
    var large: String
    var medium: String
}

struct Person: Codable {
    
    var alt: String
    var name: String
    var id: String
    
    var avatars: Images
}
