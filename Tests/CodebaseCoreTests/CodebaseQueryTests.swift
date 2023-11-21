import XCTest
@testable import CodebaseCore

final class CodebaseQueryTests: XCTestCase {

    func testClassStaticVariables() throws {
        let code = """
        public final class Foo {
            public static let constant = "constant"
            public static var computed: String { "b" }

            public static var assignedInit = Foo()
            public static var implicitlyUnwrapped: Foo!
            public static var assignedStatic = Self.default
            public static var assignedClosure: String = { "a" }()
        }
        """

        let result = Query.mutableStaticVariables(code: code, fileName: #function).map { $0.0.trimmedDescription }
        XCTAssertEqual(result.count, 4)
        XCTAssertEqual(result[0], "public static var assignedInit = Foo()")
        XCTAssertEqual(result[1], "public static var implicitlyUnwrapped: Foo!")
        XCTAssertEqual(result[2], "public static var assignedStatic = Self.default")
        XCTAssertEqual(result[3], "public static var assignedClosure: String = { \"a\" }()")
    }

    func testEnumStaticVariables() throws {
        let code = """
        public enum Foo {
            public static let constant = "constant"
            public static var computed: String { "b" }

            public static var assignedInit = Foo()
            public static var implicitlyUnwrapped: Foo!
            public static var assignedStatic = Self.default
            public static var assignedClosure: String = { "a" }()
        }
        """

        let result = Query.mutableStaticVariables(code: code, fileName: #function).map { $0.0.trimmedDescription }
        XCTAssertEqual(result.count, 4)
        XCTAssertEqual(result[0], "public static var assignedInit = Foo()")
        XCTAssertEqual(result[1], "public static var implicitlyUnwrapped: Foo!")
        XCTAssertEqual(result[2], "public static var assignedStatic = Self.default")
        XCTAssertEqual(result[3], "public static var assignedClosure: String = { \"a\" }()")

    }

    func testStructStaticVariables() throws {
        let code = """
        public struct Foo {
            public static let constant = "constant"
            public static var computed: String { "b" }

            public static var assignedInit = Foo()
            public static var implicitlyUnwrapped: Foo!
            public static var assignedStatic = Self.default
            public static var assignedClosure: String = { "a" }()
        }
        """

        let result = Query.mutableStaticVariables(code: code, fileName: #function).map { $0.0.trimmedDescription }
        XCTAssertEqual(result.count, 4)
        XCTAssertEqual(result[0], "public static var assignedInit = Foo()")
        XCTAssertEqual(result[1], "public static var implicitlyUnwrapped: Foo!")
        XCTAssertEqual(result[2], "public static var assignedStatic = Self.default")
        XCTAssertEqual(result[3], "public static var assignedClosure: String = { \"a\" }()")

    }

    func testFreeStaticVariables() throws {
        let code = """
            public static let constant = "constant"
            public static var computed: String { "b" }

            public static var assignedInit = Foo()
            public static var implicitlyUnwrapped: Foo!
            public static var assignedStatic = Self.default
            public static var assignedClosure: String = { "a" }()
        """

        let result = Query.mutableStaticVariables(code: code, fileName: #function).map { $0.0.trimmedDescription }
        XCTAssertEqual(result.count, 4)
        XCTAssertEqual(result[0], "public static var assignedInit = Foo()")
        XCTAssertEqual(result[1], "public static var implicitlyUnwrapped: Foo!")
        XCTAssertEqual(result[2], "public static var assignedStatic = Self.default")
        XCTAssertEqual(result[3], "public static var assignedClosure: String = { \"a\" }()")
    }

    func testLocations() throws {
        let code = """
            public static let constant = "constant"
            public static var computed: String { "b" }

            public static var assignedInit = Foo()
            public static var implicitlyUnwrapped: Foo!
            public static var assignedStatic = Self.default
            public static var assignedClosure: String = { "a" }()
        """

        let result = Query.mutableStaticVariables(code: code, fileName: #function)
        XCTAssertEqual(result[0].1.line, 4)
        XCTAssertEqual(result[1].1.line, 5)
        XCTAssertEqual(result[2].1.line, 6)
        XCTAssertEqual(result[3].1.line, 7)
    }
}
