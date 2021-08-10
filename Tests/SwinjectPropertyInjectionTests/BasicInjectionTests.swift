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
        let fooManager = FooManager()
        container.register(FooManagerProtocol.self, factory: { _ in fooManager })
        
        let host = Host1()
        XCTAssertNotNil(host.fooManager)
        XCTAssertEqual(host.fooManager.uuid, fooManager.uuid)
    }
    
    func testResolveShouldKeepOldScopeAsContainer() {
        let fooManager = FooManager()
        container.register(FooManagerProtocol.self, factory: { _ in fooManager })
        
        let host1 = Host1()
        let host2 = Host1()
        XCTAssertEqual(host1.fooManager.uuid, fooManager.uuid)
        XCTAssertEqual(host2.fooManager.uuid, fooManager.uuid)
    }
    
    func testResolveWithNameShouldSucceed() {
        let fooManager = FooManager()
        container.register(FooManagerProtocol.self, name: "FooManager1", factory: { _ in fooManager })
        
        let host = Host4()
        XCTAssertNotNil(host.fooManager)
        XCTAssertEqual(host.fooManager.uuid, fooManager.uuid)
    }
    
    func testResolveWithArgShouldSucceed() {
        container.register(FooManagerProtocol.self) { (resolver, userID: UInt64) -> FooManagerProtocol in
            return FooManager(userID: userID)
        }
        
        let host = Host5()
        XCTAssertNotNil(host.fooManager)
        XCTAssertEqual(host.fooManager.userID, 1)
    }
    
    func testResolveOptionalShouldSucceedWithoutRegistration() {
        let host2 = Host2()
        XCTAssertNil(host2.fooManager)
    }
}
