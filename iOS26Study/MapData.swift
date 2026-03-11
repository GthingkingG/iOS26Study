//
//  MapData.swift
//  iOS26Study
//
//  Created by One on 3/10/26.
//

import Foundation

struct MapData: Codable {
    let fullAddress: String
    let lat: String
    let lon: String
}

struct MapDataDTO: Codable {
    let addressInfo: AddressInfo
    
    struct AddressInfo: Codable {
        let fullAddress: String
    }
}

