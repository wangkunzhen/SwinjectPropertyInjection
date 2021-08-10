//
//  Injected.swift
//  
//
//  Created by Wang Kunzhen on 9/8/21.
//

import Foundation
import Swinject

@propertyWrapper
public struct Injected<Service> {
    private var service: Service
    
    public init() {
        let resolver = Self.serviceResolver()
        
        guard let service = resolver.resolve(Service.self) else {
            fatalError("Service of type \(Service.self) not found. You can try `OptionalInjected` instead.")
        }
        
        self.service = service
    }
    
    public init(name: String?) {
        let resolver = Self.serviceResolver()
        
        guard let service = resolver.resolve(Service.self, name: name) else {
            fatalError("Service of type \(Service.self) not found. You can try `OptionalInjected` instead.")
        }
        
        self.service = service
    }
    
    public init<Arg1>(argument arg1: Arg1) {
        let resolver = Self.serviceResolver()
        
        guard let service = resolver.resolve(Service.self, argument: arg1) else {
            fatalError("Service of type \(Service.self) not found. You can try `OptionalInjected` instead.")
        }
        
        self.service = service
    }
    
    public init<Arg1>(name: String?, argument arg1: Arg1) {
        let resolver = Self.serviceResolver()
        
        guard let service = resolver.resolve(Service.self, name: name, argument: arg1) else {
            fatalError("Service of type \(Service.self) not found. You can try `OptionalInjected` instead.")
        }
        
        self.service = service
    }
    
    private static func serviceResolver() -> Resolver {
        guard ResolverContainer.shared.hasResolver else {
            fatalError("`ResolverContainer.shared.set(resolver:)` needs to be called first.")
        }
        
        return ResolverContainer.shared
    }
    
    public var wrappedValue: Service {
        get { return service }
        mutating set { service = newValue }
    }
    
    public var projectedValue: Injected<Service> {
        get { return self }
        mutating set { self = newValue }
    }
}
