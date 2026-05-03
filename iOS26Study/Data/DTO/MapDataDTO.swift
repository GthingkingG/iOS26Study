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

struct MapDataRequestDTO: Codable {
    var lat: String
    var lon: String
}

struct MapDataResponseDTO: Codable {
    
    /* 서버 */
    let addressInfo: AddressInfo
    
    struct AddressInfo: Codable {
        let fullAddress: String
        let addressType: String
        let city_do: String
        let gu_gun: String
        let eup_myun: String
        let adminDong: String
        let adminDongCode: String
        let legalDong: String
        let legalDongCode: String
        let ri: String
        let bunji: String
        let roadName: String
        let buildingIndex: String
        let buildingName: String
        let mappingDistance: String
        let roadCode: String
    }
}

extension MapDataResponseDTO {
    func toDomain() -> String {
        return addressInfo.fullAddress
    }
}
