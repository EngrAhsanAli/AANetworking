//
//  AANetworking+Constants.swift
//  AANetworking
//
//  Created by MacBook Pro on 08/03/2019.
//

import Moya

public typealias AANetwork_Method = Moya.Method
public typealias AANetwork_Task = Task
public typealias AANetwork_Provider = MoyaProvider
public typealias AANetwork_Response = Moya.Response
public typealias AANetwork_Cancellable = Cancellable
public typealias AANetwork_Error = MoyaError
public typealias AANetwork_CompletionResponse = ((Any) -> ())
public typealias AANetwork_CompletionError = ((AANetwork_Error) -> ())

public enum AANetwork_ResponseType {
    case object, objectPath(path: String?), string, array, arrayPath(path: String?), json
}

public protocol AANetwork_TargetType : TargetType {
    var responseType: AANetwork_ResponseType { get }
    func onRequest()
    func onResponse()
    func onError(error: AANetwork_Error)
}

public extension AANetwork_TargetType {
    func onRequest() {}
    func onResponse() {}
    func onError(error: AANetwork_Error) {}
}
