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
        let host = Host()
        XCTAssertNil(host.manager)
        
        container.register(Manager.self, factory: { _ in Manager() })
        let host2 = Host()
        XCTAssertNotNil(host2.manager)
    }
    
    static var allTests = [
        ("testResolveShouldSucceed", testResolveShouldSucceed)
    ]
}

extension OptionalInjectionTests {
    private class Manager {
        let uuid = UUID().uuidString
    }
    
    private class Host {
        @OptionalInjected var manager: Manager?
    }
}
