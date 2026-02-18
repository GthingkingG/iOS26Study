//
//  SettingsSectionType.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI

/// **설정 섹션 타입:**
/// - first : 위치, 알림, 업그레이드
/// - reference : 참조
/// - interface : 인터페이스
/// - pro : PRO 구독
/// - donation : 성원을 보내 주세요
/// - etc : 도움말, 개인정보, 이용약관, 후원자
enum SettingsSectionType: CaseIterable {
    case first
    case reference
    case interface
    case pro
    case donation
    case etc
    
    var content: [SettingsSectionRow] {
        switch self {
        case .first:
            [.location, .alert, .upgrade]
        case .reference:
            [.myth, .constellation, .mark, .basicDirection, .satellite, .crew]
        case .interface:
            [.atmosphere, .night, .music, .sound, .haptic, .language]
        case .pro:
            [.vision, .imagingCalculator, .coordinate]
        case .donation:
            [.evaluation, .share]
        case .etc:
            [.help, .privacy, .terms, .sponsors]
        }
    }
}





