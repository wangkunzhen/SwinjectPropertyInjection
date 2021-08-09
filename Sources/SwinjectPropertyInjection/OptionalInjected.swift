//
//  OptionalInjected.swift
//  
//
//  Created by Wang Kunzhen on 9/8/21.
//

import Foundation

@propertyWrapper
public struct OptionalInjected<Service> {
    private var service: Service?
    
    public init() {
        guard ResolverContainer.shared.hasResolver else {
            fatalError("`ResolverContainer.shared.set(resolver:)` needs to be called first.")
        }
        
        self.service = ResolverContainer.shared.resolve(Service.self)
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
