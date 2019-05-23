//
//  AANetworking.swift
//  AANetworking
//
//  Created by Muhammad Ahsan Ali on 08/03/2019.
//

import Moya

extension AANetwork_Provider {
    
    @discardableResult
    open func request<T: Codable>(_ target: AANetwork_TargetType, type: T.Type, completion: @escaping AANetwork_CompletionResponse, onError: AANetwork_CompletionError? = nil) -> AANetwork_Cancellable {
        
        target.onRequest()
        
        return request(target as! Target) { (result) in
            
            var statusCode: Int
            switch result {
            case let .success(response):
                statusCode = response.statusCode
                do {
                    var responseData: Any
                    switch target.responseType {
                    case .object:
                        responseData = try response.mapObject(T.self)
                    case .objectPath(let path):
                        responseData = try response.mapObject(T.self, path: path)
                    case .array:
                        responseData = try response.mapArray(T.self)
                    case .arrayPath(let path):
                        responseData = try response.mapArray(T.self, path: path)
                    case .map:
                        responseData = try response.map(T.self)
                    case .mapPath(let path):
                        responseData = try response.map(T.self, atKeyPath: path)
                    case .string:
                        responseData = try response.mapString()
                    case .stringPath(let path):
                        responseData = try response.mapString(atKeyPath: path)
                    case .image:
                        responseData = try response.mapImage()
                    case .data:
                        responseData = response.data
                    case .json:
                        responseData = try response.mapJSON()
                    }
                    completion(responseData)
                    
                } catch {
                    completion(response)
                    print("AANetworkHelper: ", error.localizedDescription)
                }
                
                break
                
            case let .failure(error):
                statusCode = error.response?.statusCode ?? error.errorCode
                onError?(error)
                target.onError(error: error)
                print("AANetworkHelper: Error...\(error.localizedDescription)")
            }
            
            target.onResponse(statusCode: statusCode)
        }
    }
}


