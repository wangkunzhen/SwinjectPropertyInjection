//
//  ResolverContainer.swift
//  
//
//  Created by Wang Kunzhen on 9/8/21.
//

import Foundation
import Swinject

public final class ResolverContainer {
    
    public static let shared = ResolverContainer()
    
    private var _resolver: Resolver?
    
    private var resolver: Resolver {
        guard let r = _resolver else {
            fatalError("You need to call `set(resolver:)` before resolving.")
        }
        
        return r
    }
    
    public func set(resolver: Resolver) {
        self._resolver = resolver
    }
    
    public func reset() {
        self._resolver = nil
    }
}

extension ResolverContainer: Resolver {
    public func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return resolver.resolve(serviceType)
    }
    
    public func resolve<Service>(_ serviceType: Service.Type, name: String?) -> Service? {
        return resolver.resolve(serviceType, name: name)
    }
    
    public func resolve<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service? {
        return resolver.resolve(serviceType, argument: argument)
    }
    
    public func resolve<Service, Arg1>(_ serviceType: Service.Type, name: String?, argument: Arg1) -> Service? {
        return resolver.resolve(serviceType, name: name, argument: argument)
    }
    
    public func resolve<Service, Arg1, Arg2>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2) -> Service? {
        return resolver.resolve(serviceType, arguments: arg1, arg2)
    }
    
    public func resolve<Service, Arg1, Arg2>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2) -> Service? {
        return resolver.resolve(serviceType, name: name, arguments: arg1, arg2)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> Service? {
        return resolver.resolve(serviceType, arguments: arg1, arg2, arg3)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> Service? {
        return resolver.resolve(serviceType, name: name, arguments: arg1, arg2, arg3)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) -> Service? {
        return resolver.resolve(serviceType, arguments: arg1, arg2, arg3, arg4)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) -> Service? {
        return resolver.resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5) -> Service? {
        return resolver.resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5) -> Service? {
        return resolver.resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6) -> Service? {
        return resolver.resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5, arg6)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6) -> Service? {
        return resolver.resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5, arg6)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7) -> Service? {
        return resolver.resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7) -> Service? {
        return resolver.resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8) -> Service? {
        return resolver.resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg8)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8) -> Service? {
        return resolver.resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8, _ arg9: Arg9) -> Service? {
        return resolver.resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg8, arg9)
    }
    
    public func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8, _ arg9: Arg9) -> Service? {
        return resolver.resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    }
}
