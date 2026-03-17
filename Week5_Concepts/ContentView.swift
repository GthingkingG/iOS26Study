//
//  ContentView.swift
//  Week5_Concepts
//
//  Created by One on 3/17/26.
//

import SwiftUI

struct ContentView: View {
    
    let keychain = KeychainService.shared
    
    let tokenInfo = TokenInfo(accessToken: "abc123", refreshToken: "xyz456")
    
    let account = "helloWorld"
    let service = "WorkBookTest"
    let password = "mySecurePassword"
    
    enum KeychainButtonType: String, CaseIterable {
        case save = "저장하기"
        case load = "불러오기"
        case delete = "삭제하기"
    }
    
    enum ButtonType: String, CaseIterable {
        case save = "저장하기"
        case load = "불러오기"
        case delete = "삭제하기"
    }
    
    var body: some View {
        VStack(spacing: 10, content: {
            ForEach(KeychainButtonType.allCases, id: \.rawValue, content: { button in
                Button(action: {
                    keychainHandleAction(button)
                }, label: {
                    Text(button.rawValue)
                        .font(.title)
                })
            })
            
            Divider()
            
            ForEach(ButtonType.allCases, id: \.rawValue, content: { button in
                Button(action: {
                    handleAction(button)
                }, label: {
                    Text(button.rawValue)
                        .font(.title)
                })
            })
        })
    }
    
    func keychainHandleAction(_ type: KeychainButtonType) {
        switch type {
        case .save:
            self.saveStatus()
        case .load:
            self.loadStatus()
        case .delete:
            self.deletedStatus()
        }
    }
    
    func saveStatus() {
        let saveStatus = keychain.savePasswordToKeychain(account: account, service: service, password: password)
        if saveStatus == errSecSuccess {
            print("비밀번호 저장 성공")
        } else {
            print("비밀번호 저장 실패: ", saveStatus)
        }
    }
    
    func loadStatus() {
        if let retrivedPassword = keychain.load(account: account, service: service) {
            print("불러온 비밀번호: ", retrivedPassword)
        } else {
            print("저장된 비밀번호 없음")
        }
    }
    
    func deletedStatus() {
        let deleteStatus = keychain.delete(account: account, service: service)
        if deleteStatus == errSecSuccess {
            print("비밀번호 삭제 완료")
        } else {
            print("비밀번호 삭제 실패: ", deleteStatus)
        }
    }
    
    func handleAction(_ type: ButtonType) {
        switch type {
        case .save:
            keychain.saveToken(tokenInfo)
        case .load:
            keychain.loadToken()
        case .delete:
            keychain.deleteToken()
        }
    }
}

#Preview {
    ContentView()
}
