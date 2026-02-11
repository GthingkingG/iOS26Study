//
//  SettingsSectionRow.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI

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
    
    var icon: String {
        switch self {
        case .location:
            return "🔰"
        case .alert:
            return "🔔"
        case .upgrade:
            return "💼"
        case .myth:
            return "🌀"
        case .constellation:
            return "💠"
        case .mark:
            return "🅿️"
        case .basicDirection:
            return "🔹"
        case .satellite:
            return "🛜"
        case .crew:
            return "Ⓜ️"
        case .atmosphere:
            return "☪️"
        case .night:
            return "☯️"
        case .music:
            return "⛎"
        case .sound:
            return "♍️"
        case .haptic:
            return "♓️"
        case .language:
            return "🆔"
        case .vision:
            return "🛍️"
        case .imagingCalculator:
            return "🎟️"
        case .coordinate:
            return "🎀"
        case .evaluation:
            return "⭐️"
        case .share:
            return "🧑🏻‍🎤"
        case .help:
            return "🛟"
        case .privacy:
            return "✋🏻"
        case .terms:
            return "✍🏻"
        case .sponsors:
            return "❤️"
        }
    }
    
    var font: Font {
        switch self {
        case .vision, .imagingCalculator, .coordinate:
            return .body
        default:
            return .headline
        }
    }
    
    var titleColor: Color {
        switch self {
        case .vision, .imagingCalculator, .coordinate:
            return .gray
        default:
            return .white
        }
    }
    
    var viewType: SectionViewType {
        switch self {
        case .alert, .upgrade, .crew, .atmosphere, .language, .imagingCalculator, .coordinate, .evaluation, .share, .help, .privacy, .terms, .sponsors:
            return .normal
        case .location, .vision:
            return .decsription
        case .myth, .constellation, .mark, .basicDirection, .satellite, .night, .music, .sound, .haptic:
            return .toggle
        }
    }
    
    
}
