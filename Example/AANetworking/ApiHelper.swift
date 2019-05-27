//
//  ApiHelper.swift
//  AANetworking_Example
//
//  Created by Muhammad Ahsan Ali on 08/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import AANetworking

enum Api {
    case api1, api2
}

extension Api: AANetwork_TargetType {
    
    var baseURL: URL {
        return URL(string: "https://reqres.in")!
    }
    
    func onRequest() {
        showProgressDialog("Loading")
    }
    
    func onResponse(statusCode: Int, response: Any) {
        print(response)
        hideProgressDialog()
    }
    
    func onError(error: AANetwork_Error) {
        showProblem(error.localizedDescription)
    }
    
    var responseType: AANetwork_ResponseType {
        switch self {
        case .api1:
            return .object
        case .api2:
            return .json
        }
    }

    var path: String {
        switch self {
        case .api1, .api2:
            return "/api/users?page=2"
        }
    }
    
    var method: AANetwork_Method {
        switch self {
            
        case .api1, .api2:
            return .get
        default:
            return .post
        }
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
