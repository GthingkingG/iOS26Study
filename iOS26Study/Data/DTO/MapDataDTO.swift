//
//  MapDataDTO.swift
//  iOS26Study
//
//  Created by One on 3/15/26.
//

import Foundation


//protocol MapDTO {
//    var lat: CGFloat { get set }
//    var lon: CGFloat { get set }
//}
//
//struct MapDataResponseDTO: Codable, MapDTO {
//    let addressInfo: AddressInfo
//    var lat: CGFloat
//    var lon: CGFloat
//    
//    struct AddressInfo: Codable {
//        let fullAddress: String
//    }
//}
//
//struct MapDataRequestDTO: Codable, MapDTO {
//    var lat: CGFloat
//    var lon: CGFloat
//}

struct MapDataDTO: Codable {
    
    /* 서버 */
    let addressInfo: AddressInfo
}

extension MapDataDTO {
    func toDomain() -> MapData {
        MapData(fullAddress: addressInfo.fullAddress, lat: lat, lon: lon)
        
    }
}
