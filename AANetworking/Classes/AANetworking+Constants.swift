//
//  AANetworking+Constants.swift
//  AANetworking
//
//  Created by Muhammad Ahsan Ali on 08/03/2019.
//

import Moya

public typealias AANetwork_Method = Moya.Method
public typealias AANetwork_Task = Task
public typealias AANetwork_Provider = MoyaProvider
public typealias AANetwork_Response = Moya.Response
public typealias AANetwork_Cancellable = Cancellable
public typealias AANetwork_Error = MoyaError
public typealias AANetwork_Result = Result
public typealias AANetwork_CompletionResponse = ((Any) -> ())
public typealias AANetwork_CompletionError = ((AANetwork_Error) -> ())

public enum AANetwork_ResponseType {
    case object, objectPath(path: String?)
    case array, arrayPath(path: String?)
    case map, mapPath(path: String?), mapJSONDecoder(JSONDecoder), mapJSONDecoderPath(JSONDecoder, String?)
    case string, stringPath(path: String?)
    case json, image, data
}

public protocol AANetwork_TargetType : TargetType {
    var responseType: AANetwork_ResponseType { get }
    func onRequest()
    func onResponse(statusCode: Int, response: Any)
    func onError(error: AANetwork_Error)
}

public extension AANetwork_TargetType {
    func onRequest() {}
    func onResponse(statusCode: Int, response: Any) {}
    func onError(error: AANetwork_Error) {}
}
