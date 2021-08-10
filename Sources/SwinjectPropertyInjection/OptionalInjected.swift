//
//  OptionalInjected.swift
//  
//
//  Created by Wang Kunzhen on 9/8/21.
//

import Foundation
import Swinject

@propertyWrapper
public struct OptionalInjected<Service> {
    private var service: Service?
    
    public init() {
        guard ResolverContainer.shared.hasResolver else {
            fatalError("`ResolverContainer.shared.set(resolver:)` needs to be called first.")
        }
        
        self.service = ResolverContainer.shared.resolve(Service.self)
    }
    
    public init(name: String?) {
        let resolver = Self.serviceResolver()
        
        self.service = resolver.resolve(Service.self, name: name)
    }
    
    public init<Arg1>(argument arg1: Arg1) {
        let resolver = Self.serviceResolver()
        
        self.service = resolver.resolve(Service.self, argument: arg1)
    }
    
    public init<Arg1>(name: String?, argument arg1: Arg1) {
        let resolver = Self.serviceResolver()
        
        self.service = resolver.resolve(Service.self, name: name, argument: arg1)
    }
    
    private static func serviceResolver() -> Resolver {
        guard ResolverContainer.shared.hasResolver else {
            fatalError("`ResolverContainer.shared.set(resolver:)` needs to be called first.")
        }
        
        return ResolverContainer.shared
    }
    
    public var wrappedValue: Service? {
        get { return service }
        mutating set { service = newValue }
    }
    
    public var projectedValue: OptionalInjected<Service> {
        get { return self }
        mutating set { self = newValue }
    }
}
