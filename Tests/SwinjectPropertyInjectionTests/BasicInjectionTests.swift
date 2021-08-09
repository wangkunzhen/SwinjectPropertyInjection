import XCTest
import Swinject
@testable import SwinjectPropertyInjection

final class BasicInjectionTests: XCTestCase {
    private var container: Container!
    
    override func setUp() {
        container = Container(defaultObjectScope: .container)
        
        ResolverContainer.shared.set(resolver: container)
    }
    
    override func tearDown() {
        container.removeAll()
    }
    
    func testResolveShouldSucceed() {
        container.register(Manager.self, factory: { _ in Manager() })
        
        let host = Host()
        XCTAssertNotNil(host.manager)
    }
    
    func testResolveShouldKeepOldScopeAsContainer() {
        container.register(Manager.self, factory: { _ in Manager() })
        
        let host1 = Host()
        let host2 = Host()
        XCTAssertEqual(host1.manager.uuid, host2.manager.uuid)
    }
    
    func testResolveOptionalShouldSucceedWithoutRegistration() {
        let host2 = Host2()
        XCTAssertNil(host2.manager)
    }

    static var allTests = [
        ("testResolveShouldSucceed", testResolveShouldSucceed),
        ("testResolveShouldKeepOldScopeAsContainer", testResolveShouldKeepOldScopeAsContainer)
    ]
}

extension BasicInjectionTests {
    private class Manager {
        let uuid = UUID().uuidString
    }
    
    private class Host {
        @Injected var manager: Manager
    }
    
    private class Host2 {
        @Injected var manager: Manager?
    }
}
