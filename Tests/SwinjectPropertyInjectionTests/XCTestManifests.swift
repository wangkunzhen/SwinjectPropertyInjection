import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwinjectPropertyInjectionTests.allTests),
    ]
}
#endif
