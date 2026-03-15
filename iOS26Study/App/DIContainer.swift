//
//  DIScope.swift
//  iOS26Study
//
//  Created by One on 3/15/26.
//

import Foundation

enum DIScope {
    case singleton
    case transient
}

protocol Resolver {
    func resolve<T>(_ type: T.Type) -> T
}

final class DIContainer: Resolver {
    typealias Factory = (Resolver) -> Any
    
    private struct Entry {
        let scope: DIScope
        let factory: Factory
        var instance: Any?
    }
    
    private var entries: [ObjectIdentifier: Entry] = [:]
    private let lock = NSRecursiveLock()
    
    func register<T>(
        _ type: T.Type,
        scope: DIScope = .transient,
        factory: @escaping (Resolver) -> T
    ) {
        let key = ObjectIdentifier(type)
        lock.lock(); defer { lock.unlock() }
        entries[key] = Entry(scope: scope, factory: factory, instance: nil)
    }
    
    func resolve<T>(_ type: T.Type = T.self) -> T {
        let key = ObjectIdentifier(type)
        lock.lock(); defer { lock.unlock() }
        
        guard var entry = entries[key] else {
            fatalError("No registration for \(type)")
        }
        
        switch entry.scope {
        case .singleton:
            if let cached = entry.instance as? T { return cached }
            guard let created = entry.factory(self) as? T else {
                fatalError("Type cast failed for \(type)")
            }
            entry.instance = created
            entries[key] = entry
            return created
        case .transient:
            guard let created = entry.factory(self) as? T else {
                fatalError("Type case failed for \(type)")
            }
            return created
        }
    }
}
