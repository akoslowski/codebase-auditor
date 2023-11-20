import XCTest
@testable import CodebaseCore

final class CodebaseQueryTests: XCTestCase {


    func testClassStaticVariables() throws {
        let code = """
        public final class Foo {
            public static let something = "else"
            public static var frameworkBridge = AdvertisementsBridge()
            public static var dependencies: XNGNativeAdvertisingDependencies!
            public static var current = Self.default
        }
        """

        let result = Query.staticVariablesWithValueAssignment(code: code, fileName: #function)
        XCTAssertEqual(result.count, 3)
    }

    func testEnumStaticVariables() throws {
        let code = """
        public enum Foo {
            public static let something = "else"
            public static var frameworkBridge = AdvertisementsBridge()
            public static var dependencies: XNGNativeAdvertisingDependencies!
            public static var current = Self.default
        }
        """

        let result = Query.staticVariablesWithValueAssignment(code: code, fileName: #function)
        XCTAssertEqual(result.count, 3)

    }

    func testStructStaticVariables() throws {
        let code = """
        public struct Foo {
            public static let something = "else"
            public static var frameworkBridge = AdvertisementsBridge()
            public static var dependencies: XNGNativeAdvertisingDependencies!
            public static var current = Self.default
        }
        """

        let result = Query.staticVariablesWithValueAssignment(code: code, fileName: #function)
        XCTAssertEqual(result.count, 3)

    }

    func testFreeStaticVariables() throws {
        let code = """
        public static let something = "else"
        public static var frameworkBridge = AdvertisementsBridge()
        public static var dependencies: XNGNativeAdvertisingDependencies!
        public static var current = Self.default
        """

        let result = Query.staticVariablesWithValueAssignment(code: code, fileName: #function)
        XCTAssertEqual(result.count, 3)
    }
}
