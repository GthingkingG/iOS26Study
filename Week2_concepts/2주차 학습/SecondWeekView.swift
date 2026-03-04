//
//  SecondWeekView.swift
//  iOS26Study
//
//  Created by One on 2/25/26.
//

import SwiftUI

struct SecondWeekView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

//Clean Architecture
//struct NoticeView: View {
//    let repository = NoticeRepositoryImpl()
//    let useCase = NoticeUsecase(repository: repository)
//}
//
//protocol NoticeUseCaseProtocol: Sendable {
//    func fetchNoticeList() async throws -> [Notice]
//}
//
//@MainActor
//@Observable
//final class NoticeListViewModel {
//    private let useCase: NoticeUseCaseProtocol
//    init(useCase: NoticeUseCaseProtocol) {
//        self.useCase = useCase
//    }
//}


//Domain 계층 심화: UseCase
//protocol NoticeUseCaseProtocol: Sendable {
//    func fetchNoticeList(sort: NoticeSortOrder, filterRead: NoticeReadFilter) async throws -> [Notice]
//    func markAsRead(id: String) async throws
//}
//
//struct NoticeInput: Sendable {
//    let title: String
//    func validate() throws {
//        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//            throw AppError.business("temp.")
//        }
//    }
//}

//Data 계층 심화: Repository, DTO, DataSource
//struct NoticeDTO: Codable { let id: String; let title: String; let isRead: Bool; let createdAt: String }
//
//struct APIResponse<T: Decodable>: Decodable {
//    let code: Int
//    let message: String
//    let data: T
//    func unwrap() throws -> T {
//        guard code == 200 else { throw AppError.business(message) }
//        return data
//    }
//}
//
//actor NoticeRepositoryImpl: NoticeRepositoryProtocol {
//    private let dataSources: NoticeDataSource
//    func fectchNoticeList() async throws -> [Notice] {
//        do {
//            let response: APIResponse<[NoticeDTO]> = try await dataSources.fectchNoticeList()
//            let dtos = try response.unwrap()
//            return try dtos.mape { dto in
//                guard let date = ISO8601DateFormatter().date(from: dto.createdAt) else { throw AppError.decode }
//                return Notice(id: dto.id, title: dto.title, isRead: dto.isRead, createdAt: date)
//            }
//        } catch {
//            if let appError = error as? AppError { throw appError }
//            throw AppError.network
//        }
//    }
//}

//DIContainer와 Environment 분리
//@Observable
//final class DIAssembler {
//    let noticeUseCase: any NoticeUseCaseProtocol
//    init(api: APIClient) {
//        let repo = NoticeRepositoryImpl(dataSource: NoticeDataSource(client: api))
//        noticeUseCase = noticeUseCase(repository: repo)
//    }
//}
//
//struct AppContent: Equatable {
//    var isLoggedIn: Bool = false
//    var currentTab: AppTab = .home
//    var showBottomAccessory: Bool = false
//}
//
//private struct AppContextKey: EnvironmentKey { static let defaultValue = AppContext() }
//extension EnvironmentValues {
//    var appContext: AppContext {
//        get { self[AppContextKey.self] }
//        set { self[AppcontextKey.self] = newValue }
//    }
//}
