//
//  OptionalInjectionTests.swift
//  
//
//  Created by Wang Kunzhen on 9/8/21.
//

import XCTest
import Swinject
@testable import SwinjectPropertyInjection

final class OptionalInjectionTests: XCTestCase {
    private var container: Container!
    
    override func setUp() {
        container = Container(defaultObjectScope: .container)
        ResolverContainer.shared.set(resolver: container)
    }
    
    override func tearDown() {
        container.removeAll()
    }
    
    func testResolveShouldSucceed() {
        let host = Host3()
        XCTAssertNil(host.fooManager)
        
        let fooManager = FooManager()
        container.register(FooManagerProtocol.self, factory: { _ in fooManager })
        
        let host2 = Host3()
        XCTAssertNotNil(host2.fooManager)
        XCTAssertEqual(host2.fooManager?.uuid, fooManager.uuid)
    }
}
