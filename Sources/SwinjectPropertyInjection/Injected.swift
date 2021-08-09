//
//  Injected.swift
//  
//
//  Created by Wang Kunzhen on 9/8/21.
//

import Foundation

@propertyWrapper
public struct Injected<Service> {
    private var service: Service
    
    public init() {
        guard let service = ResolverContainer.shared.resolve(Service.self) else {
            fatalError("Service of type \(Service.self) not found. Use `OptionalInjected` instead.")
        }
        
        self.service = service
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
