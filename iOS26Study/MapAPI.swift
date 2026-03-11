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
        case .gerAddress(let lat, let lon):
            return .requestParameters(parameters: ["version": "1", "lat": lat, "lon": lon, "addressType": "A10"], encoding: URLEncoding.queryString)
        }
    }
}
