import XCTest
import Swinject
@testable import SwinjectPropertyInjection

final class SwinjectPropertyInjectionTests: XCTestCase {
    private var container: Container!
    
    override func setUp() {
        container = Container(defaultObjectScope: .container)
        container.register(Manager.self, factory: { _ in Manager() })
        
        ResolverContainer.shared.set(resolver: container)
    }
    
    override func tearDown() {
        container.removeAll()
    }
    
    func testResolveShouldSucceed() {
        let host = Host()
        XCTAssertNotNil(host.manager)
    }
    
    func testResolveShouldKeepOldScopeAsContainer() {
        let host1 = Host()
        let host2 = Host()
        XCTAssertEqual(host1.manager.uuid, host2.manager.uuid)
    }

    static var allTests = [
        ("testResolveShouldSucceed", testResolveShouldSucceed),
        ("testResolveShouldKeepOldScopeAsContainer", testResolveShouldKeepOldScopeAsContainer)
    ]
}

extension SwinjectPropertyInjectionTests {
    private class Manager {
        let uuid = UUID().uuidString
    }
    
    private class Host {
        @Injected var manager: Manager
    }
}
