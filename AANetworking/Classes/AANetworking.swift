//
//  AANetworking.swift
//  AANetworking
//
//  Created by MacBook Pro on 08/03/2019.
//

import Moya

extension AANetwork_Provider {
    
    @discardableResult
    open func request<T: Codable>(_ target: AANetwork_TargetType, type: T.Type, completion: @escaping AANetwork_CompletionResponse, onError: AANetwork_CompletionError? = nil) -> AANetwork_Cancellable {
        
        target.onRequest()
        
        return request(target as! Target) { (result) in
            
            target.onResponse()
            
            switch result {
            case let .success(response):
                do {
                    var responseData: Any
                    switch target.responseType {
                    case .objectPath(let path):
                        responseData = try response.mapObject(T.self, path: path)
                    case .arrayPath(let path):
                        responseData = try response.mapArray(T.self, path: path)
                    case .json:
                        responseData = try response.mapJSON()
                    case .string:
                        responseData = try response.mapString()
                    case .object:
                        responseData = try response.mapObject(T.self)
                    case .array:
                        responseData = try response.mapObject(T.self)
                    }
                    completion(responseData)
                } catch {
                    completion(response)
                    print("AANetworkHelper: ", error.localizedDescription)
                }
                
                break
                
            case let .failure(error):
                onError?(error)
                target.onError(error: error)
                print("AANetworkHelper: Error...\(error.localizedDescription)")
            }
        }
    }
}


