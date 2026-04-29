import Foundation

//func fetchData(from url: String) async throws -> String {
//    try await Task.sleep(for: .seconds(1))
//    return "\(url)로부터 데이터 가져오기"
//}
////
////func fetchDataConcurrently() async throws {
////    async let firstData: String = fetchData(from: "URL1")
////    async let secondData: String = fetchData(from: "URL2")
////    async let thirdData: String = fetchData(from: "URL3")
////    
////    let result: [String] = try await [firstData, secondData, thirdData]
////    print(result)
////}
////
////do {
////    try await fetchDataConcurrently()
////}
//func fetchAllData() async throws -> [String] {
//    let dataResult: [String] = try await withThrowingTaskGroup(of: String.self) { group in
//        let urls: [String] = ["URL1", "URL2", "URL3"]
//        for url in urls {
//            group.addTask {
//                try await fetchData(from: url)
//            }
//        }
//        var results: [String] = []
//        for try await result in group {
//            results.append(result)
//        }
//        return results
//    }
//    return dataResult
//}
//print(try await fetchAllData())
//
//nonisolated(unsafe) var callCount: Int = 0
//
//func fetchData2(from url: String) async throws -> String {
//    print("\(url)에 네트워크 요청 중 - - - ")
//    callCount += 1
//    try await Task.sleep(for: .seconds(callCount))
//    return "\(url)로부터 데이터"
//}
//
//func fetchAllData2() async throws -> [Result<String, Error>] {
//    let dataResult: [Result<String, Error>] = try await withThrowingTaskGroup(of: Result<String, Error>.self) { group in
//        let urls: [String] = ["URL1", "URL2", "URL3"]
//        
//        for url in urls {
//            group.addTask {
//                do {
//                    try Task.checkCancellation()
//                    let result: String = try await fetchData2(from: url)
//                    if Task.isCancelled {
//                        return .failure(CancellationError())
//                    }
//                    return .success(result)
//                } catch {
//                    return .failure(error)
//                }
//            }
//        }
//        try await Task.sleep(for: .seconds(1.5))
//        
//        group.cancelAll()
//        
//        var results: [Result<String, Error>] = []
//        for try await result in group {
//            results.append(result)
//        }
//        return results
//    }
//    return dataResult
//}
//
//print(try await fetchAllData2())
//
//actor BankAccountClass {
//    var balance: Int = 0
//    
//    func deposit(_ amount: Int) {
//        balance += amount
//    }
//    
//    func withdraw(_ amount: Int) {
//        balance -= amount
//    }
//}
//
//let classAccount: BankAccountClass = BankAccountClass()
//
//for _ in 0..<100000 {
//    await classAccount.deposit(1)
//    await classAccount.withdraw(1)
//}
//
//print(await classAccount.balance)

//struct UserInfo: Sendable {
//    let userName: String
//    let email: String
//}
//
//func processUserInfo(userInfo: UserInfo) async throws {
//    try await Task.sleep(for: .seconds(1))
//    print("사용자 정보 처리 중... 이름: \(userInfo.userName), 이메일: \(userInfo.email)")
//}
//
//func handleMultipleUserInfos() async throws {
//    let users: [UserInfo] = [
//        UserInfo(userName: "user1", email: "user1@gmail.com"),
//        UserInfo(userName: "user2", email: "user2@gmail.com"),
//        UserInfo(userName: "user3", email: "user3@gmail.com")
//    ]
//    
//    await withThrowingTaskGroup(of: Void.self) { group in
//        for user in users {
//            group.addTask {
//                try await processUserInfo(userInfo: user)
//            }
//        }
//    }
//}
//
//try await handleMultipleUserInfos()
//
//@MainActor
//final class Account: Sendable {
//    let accountID: String
//    var balance: Int
//    
//    init(accountID: String, balance: Int) {
//        self.accountID = accountID
//        self.balance = balance
//    }
//    
//    func updateBalance(newBalance: Int) {
//        balance = newBalance
//    }
//}
//
//func processAccount(account: Account) async throws {
//    try await Task.sleep(for: .seconds(1))
//    print("계좌 정보 처리 중... 계좌: \(account.accountID), 잔고: \(await account.balance)")
//}
//
//func handleMultipleAccounts() async throws {
//    let accounts: [Account] = await [
//        Account(accountID: "12345", balance: 5000),
//        Account(accountID: "67890", balance: 3000),
//        Account(accountID: "54321", balance: 1000)
//    ]
//    
//    await withThrowingTaskGroup(of: Void.self) { group in
//        for account in accounts {
//            group.addTask {
//                try await processAccount(account: account)
//            }
//        }
//    }
//}
//
//
//try await handleMultipleAccounts()

struct Person {
    var name: String
    var age: Int
}

var yagom: Person = Person(name: "yagom", age: 20)
var me: Person = yagom

me.name = "One"

print(yagom.name)
print(me.name)

struct DatabaseConnection: Copyable {
    private var connectionID: Int
    
    init(connectionID: Int) {
        self.connectionID = connectionID
        print("Database connected with ID: \(connectionID)")
    }
    
    func executeQuery(_ query: String) {
        print("Excuting query on connection \(connectionID): \(query)")
    }
}

func performDatabaseOperations() {
    let dbConnection: DatabaseConnection = DatabaseConnection(connectionID: 1234)
    let dbConnectionCopy: DatabaseConnection = dbConnection
    
    dbConnectionCopy.executeQuery("SELECT * FROM users")
    dbConnection.executeQuery("SELECT * FROM orders")
}

performDatabaseOperations()

struct NetworkSoket: ~Copyable {
    private var socketDescriptor: Int32
    
    init(socketDescriptor: Int32) {
        self.socketDescriptor = socketDescriptor
        print("Network socket opened with descriptor: \(socketDescriptor)")
    }
    
    func sendData(_ data: Data) {
        print("Sending data through socket \(socketDescriptor): \(data)")
    }
    
    deinit {
        print("Closing network socket with descriptor: \(socketDescriptor)")
    }
}

func performNetworkOperations() {
    let socket: NetworkSoket = NetworkSoket(socketDescriptor: 456)
}

performNetworkOperations()
