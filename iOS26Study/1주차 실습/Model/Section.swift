//
//  Section.swift
//  iOS26Study
//
//  Created by One on 2/6/26.
//

import Foundation
import SwiftUI

enum SectionType: CaseIterable {
    case first
    case second
    case third
    
    var content: [SectionRow] {
        switch self {
        case .first:
            [.profile]
        case .second:
            [.plane, .ble, .wifi, .cell, .hotSpot, .battery, .vpn]
        case .third:
            [.general, .accessibility, .search, .motion, .display, .background, .standBy, .control, .camera, .home, .accessibility]
        }
    }
}

enum SectionRow {
    case profile
    case plane
    case wifi
    case ble
    case cell
    case hotSpot
    case battery
    case vpn
    case general
    case accessibility
    case search
    case motion
    case display
    case background
    case standBy
    case control
    case camera
    case home
    case siri
    
    
    var icon: String {
        switch self {
        case .profile:
            return "person.circle"
        case .plane:
            return "airplane"
        case .wifi:
            return "wifi"
        case .ble:
            return "bonjour"
        case .cell:
            return "antenna.radiowaves.left.and.right"
        case .hotSpot:
            return "personalhotspot"
        case .battery:
            return "battery.100percent"
        case .vpn:
            return "globe"
        case .general:
            return "gear"
        case .accessibility:
            return "accessibility"
        case .search:
            return "magnifyingglass"
        case .motion:
            return "button.vertical.left.press"
        case .display:
            return "sun.min.fill"
        case .background:
            return "atom"
        case .standBy:
            return "app.badge.clock"
        case .control:
            return "switch.2"
        case .camera:
            return "camera.fill"
        case .home:
            return "entry.lever.keypad"
        case .siri:
            return "siri"
        }
    }
    
    var title: String {
        switch self {
        case .profile:
            return "김동민"
        case .plane:
            return "에어플레인 모드"
        case .wifi:
            return "Wi-Fi"
        case .ble:
            return "Bluetooth"
        case .cell:
            return "셀룰러"
        case .hotSpot:
            return "개인용 핫스팟"
        case .battery:
            return "배터리"
        case .vpn:
            return "VPN"
        case .general:
            return "일반"
        case .accessibility:
            return "손쉬운 사용"
        case .search:
            return "검색"
        case .motion:
            return "동작 버튼"
        case .display:
            return "디스플레이 및 밝기"
        case .background:
            return "배경화면"
        case .standBy:
            return "스탠바이"
        case .control:
            return "제어 센터"
        case .camera:
            return "카메라"
        case .home:
            return "홈 화면 및 앱 보관함"
        case .siri:
            return "Apple Intelligence 및 Siri"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .profile:
            return .green.opacity(0.6)
        case .plane:
            return .orange
        case .wifi, .ble, .vpn, .accessibility, .motion, .display, .home:
            return .blue
        case .cell, .hotSpot, .battery:
            return .green
        case .general, .search, .control, .camera:
            return .gray
        case .background:
            return .mint
        case .standBy:
            return .black
        case .siri:
            return .purple
        }
    }
    
    var discription: String? {
        switch self {
        case .profile:
            return "Apple 계정, iCloud+ 등"
        case .wifi:
            return "KT_GIGA_5G_6DB3"
        case .ble:
            return "켬"
        case .vpn:
            return "연결 안 됨"
        default:
            return nil
        }
    }
}
