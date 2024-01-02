//
//  KPListSearchRequest.swift
//  KPNetwork
//
//  Created by Victor on 26.12.2023.
//

import Foundation

public struct KPListSearchRequest: KPNetworkRequest {
    
    public typealias Response = KPListSearchEntity
    
    public init(category: [String]? = nil) {
        parameters["category"] = category?.joined(separator: ",")
    }
    
    public var url: String {
        "list"
    }
    
    public var method: KPHTTPMethod {
        .GET
    }
    
    public var parameters  = ["limit": "250"]
}
