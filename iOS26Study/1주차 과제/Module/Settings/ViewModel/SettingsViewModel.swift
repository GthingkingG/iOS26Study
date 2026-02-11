//
//  SettingsViewModel.swift
//  iOS26Study
//
//  Created by One on 2/11/26.
//

import SwiftUI
import Observation

@Observable
class SettingsViewModel {
    var mythStatus: Bool = true
    var constellationStatus: Bool = true
    var markStatus: Bool = true
    var basicDirectionStatus: Bool = true
    var satelliteStatus: Bool = true
    var nightStatus: Bool = false
    var musicStatus: Bool = false
    var soundStatus: Bool = false
    var hapticStatus: Bool = true
}
