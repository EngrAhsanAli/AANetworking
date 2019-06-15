//
//  ApiHelper.swift
//  AANetworking_Example
//
//  Created by Muhammad Ahsan Ali on 08/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import AANetworking
import Alamofire

enum Api {
    case api1, api2, api3, api4, api5(AANetwork_Parameters), api6(Codable)
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
        case .api3:
            return .arrayPath(path: "data")
        case .api4:
            return .string
        case .api5:
            return .stringPath(path: "token")
        case .api6:
            return .string
        }
    }

    var path: String {
        switch self {
        case .api5, .api6:
            return "/api/login"
        default:
            return "/api/users?page=2"
        }
    }
    
    var method: AANetwork_Method {
        switch self {
            
        case .api5:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: AANetwork_Task {
        switch self {
        case let .api5(params):
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case let .api6(params):
            return .requestJSONEncodable(params)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
