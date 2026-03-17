//
//  APITargetType.swift
//  iOS26Study
//
//  Created by One on 3/10/26.
//

import Foundation
import Moya

protocol APITargetType: TargetType {}

extension APITargetType {
    var baseURL: URL {
        return URL(string: "\(Config.baseURL)")!
    }
    
    var headers: [String : String]? {
        switch task {
        case .requestJSONEncodable, .requestParameters:
            return ["Content-Type": "application/json", "appKey": "\(Config.appKey)"]
        case .uploadMultipart:
            return ["Content-Type": "multipart/form-data"]
        default:
            return nil
        }
    }
}

