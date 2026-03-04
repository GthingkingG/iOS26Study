//
//  DISope.swift
//  iOS26Study
//
//  Created by One on 3/4/26.
//

import Foundation

enum DISope {
    case singleton
    case transient
}

protocol Resolver {
    func resolve<T>(_ type: T.Type) -> T
}

final class DIContainer: Resolver {
    typealias Factory = (Resolver) -> Any
    
    private struct Entry {
        let scope: DISope
        let factory: Factory
        var instance: Any?
    }
    
    private var entries: [ObjectIdentifier: Entry] = [:]
    private let lock = NSRecursiveLock()
    
    func register<T>(
        _ type: T.Type,
        scope: DISope = .transient,
        factory: @escaping (Resolver) -> T
    ) {
        let key = ObjectIdentifier(type)
        
        lock.lock()
        defer { lock.unlock() }
        
        entries[key] = Entry(scope: scope, factory: factory, instance: nil)
    }
    
    func resolve<T>(_ type: T.Type = T.self) -> T {
        let key = ObjectIdentifier(type)
        
        lock.lock()
        defer { lock.unlock() }
        
        guard var entry = entries[key] else {
            fatalError("No registration found for \(type)")
        }
        
        switch entry.scope {
        case .singleton:
            if let cached = entry.instance as? T {
                return cached
            }
            guard let created = entry.factory(self) as? T else {
                fatalError("Failed to cast singleton instance for \(type)")
            }
            entry.instance = created
            entries[key] = entry
            return created
        case .transient:
            guard let created = entry.factory(self) as? T else {
                fatalError("Failed to cast transient instanc for \(type)")
            }
            return created
        }
    }
}
