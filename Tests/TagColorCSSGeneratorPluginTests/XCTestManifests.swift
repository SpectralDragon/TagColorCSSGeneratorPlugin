import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TagColorCSSGeneratorPluginTests.allTests),
    ]
}
#endif
