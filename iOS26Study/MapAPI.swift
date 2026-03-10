//
//  MapAPI.swift
//  iOS26Study
//
//  Created by One on 3/10/26.
//

import Foundation
import Moya
internal import Alamofire

enum MapAPI {
    case gerAddress(lat: String, lon: String)
}

extension MapAPI: APITargetType {
    var path: String {
        return "/tmap/geo/reversegeocoding"
    }
    
    var method: Moya.Method {
        switch self {
        case .gerAddress:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .gerAddress(let lan, let lon):
            return .requestParameters(parameters: ["lan": lan, "lon": lon], encoding: URLEncoding.queryString)
        }
    }
}
