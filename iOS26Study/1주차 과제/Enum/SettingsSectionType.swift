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


/// 설정 섹션 요소들
enum SettingsSectionRow {
    case location
    case alert
    case upgrade
    
    case myth
    case constellation
    case mark
    case basicDirection
    case satellite
    case crew
    
    case atmosphere
    case night
    case music
    case sound
    case haptic
    case language
    
    case vision
    case imagingCalculator
    case coordinate
    
    case evaluation
    case share
    
    case help
    case privacy
    case terms
    case sponsors
    
    /// 각 설정 섹션의 제목
    var title: String {
        switch self {
        case .location:
            return "위치"
        case .alert:
            return "알림"
        case .upgrade:
            return "업그레이드"
        case .myth:
            return "신화"
        case .constellation:
            return "별자리 선"
        case .mark:
            return "표식"
        case .basicDirection:
            return "기본 방위"
        case .satellite:
            return "위성"
        case .crew:
            return "대원"
        case .atmosphere:
            return "대기 및 지면"
        case .night:
            return "나이트 비전"
        case .music:
            return "음악"
        case .sound:
            return "사운드"
        case .haptic:
            return "햅틱"
        case .language:
            return "언어"
        case .vision:
            return "시야"
        case .imagingCalculator:
            return "이미징 계산기"
        case .coordinate:
            return "좌표"
        case .evaluation:
            return "App Store에서 평가하기"
        case .share:
            return "친구와 공유하기"
        case .help:
            return "도움말"
        case .privacy:
            return "개인정보 취급방침"
        case .terms:
            return "이용 약관"
        case .sponsors:
            return "도움을 주신 분들"
        }
    }
    
}
