//
//  Config.swift
//  iOS26Study
//
//  Created by One on 3/17/26.
//

import Foundation

enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist 없음")
        }
        return dict
    }()
    
    static let baseURL: String = {
        guard let baseURL = Config.infoDictionary["API_URL"] as? String else {
            fatalError()
        }
        return baseURL
    }()
    
    static let appKey: String = {
        guard let appKey = Config.infoDictionary["APP_KEY"] as? String else {
            fatalError()
        }
        return appKey
    }()
}
