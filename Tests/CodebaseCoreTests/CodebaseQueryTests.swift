import XCTest
@testable import CodebaseCore

final class CodebaseQueryTests: XCTestCase {

/*
 public static var implicitlyUnwrapped: Foo!

 VariableDeclSyntax
 ├─attributes: AttributeListSyntax
 ├─modifiers: DeclModifierListSyntax
 │ ├─[0]: DeclModifierSyntax
 │ │ ╰─name: keyword(SwiftSyntax.Keyword.public)
 │ ╰─[1]: DeclModifierSyntax
 │   ╰─name: keyword(SwiftSyntax.Keyword.static)
 ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
 ╰─bindings: PatternBindingListSyntax
   ╰─[0]: PatternBindingSyntax
     ├─pattern: IdentifierPatternSyntax
     │ ╰─identifier: identifier("implicitlyUnwrapped")
     ╰─typeAnnotation: TypeAnnotationSyntax
       ├─colon: colon
       ╰─type: ImplicitlyUnwrappedOptionalTypeSyntax
         ├─wrappedType: IdentifierTypeSyntax
         │ ╰─name: identifier("Foo")
         ╰─exclamationMark: exclamationMark


 

 public static var assignedStatic = Self.default

 Printing description of self:
 VariableDeclSyntax
 ├─attributes: AttributeListSyntax
 ├─modifiers: DeclModifierListSyntax
 │ ├─[0]: DeclModifierSyntax
 │ │ ╰─name: keyword(SwiftSyntax.Keyword.public)
 │ ╰─[1]: DeclModifierSyntax
 │   ╰─name: keyword(SwiftSyntax.Keyword.static)
 ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
 ╰─bindings: PatternBindingListSyntax
   ╰─[0]: PatternBindingSyntax
     ├─pattern: IdentifierPatternSyntax
     │ ╰─identifier: identifier("assignedStatic")
     ╰─initializer: InitializerClauseSyntax
       ├─equal: equal
       ╰─value: MemberAccessExprSyntax
         ├─base: DeclReferenceExprSyntax
         │ ╰─baseName: keyword(SwiftSyntax.Keyword.Self)
         ├─period: period
         ╰─declName: DeclReferenceExprSyntax
           ╰─baseName: identifier("default")



 public static var computed: String { "a" }

 VariableDeclSyntax
 ├─attributes: AttributeListSyntax
 ├─modifiers: DeclModifierListSyntax
 │ ├─[0]: DeclModifierSyntax
 │ │ ╰─name: keyword(SwiftSyntax.Keyword.public)
 │ ╰─[1]: DeclModifierSyntax
 │   ╰─name: keyword(SwiftSyntax.Keyword.static)
 ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
 ╰─bindings: PatternBindingListSyntax
   ╰─[0]: PatternBindingSyntax
     ├─pattern: IdentifierPatternSyntax
     │ ╰─identifier: identifier("computed")
     ├─typeAnnotation: TypeAnnotationSyntax
     │ ├─colon: colon
     │ ╰─type: IdentifierTypeSyntax
     │   ╰─name: identifier("String")
     ╰─accessorBlock: AccessorBlockSyntax
       ├─leftBrace: leftBrace
       ├─accessors: CodeBlockItemListSyntax
       │ ╰─[0]: CodeBlockItemSyntax
       │   ╰─item: StringLiteralExprSyntax
       │     ├─openingQuote: stringQuote
       │     ├─segments: StringLiteralSegmentListSyntax
       │     │ ╰─[0]: StringSegmentSyntax
       │     │   ╰─content: stringSegment("a")
       │     ╰─closingQuote: stringQuote
       ╰─rightBrace: rightBrace


 public static var assignedClosure: String = { "a" }()

 VariableDeclSyntax
 ├─attributes: AttributeListSyntax
 ├─modifiers: DeclModifierListSyntax
 │ ├─[0]: DeclModifierSyntax
 │ │ ╰─name: keyword(SwiftSyntax.Keyword.public)
 │ ╰─[1]: DeclModifierSyntax
 │   ╰─name: keyword(SwiftSyntax.Keyword.static)
 ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
 ╰─bindings: PatternBindingListSyntax
   ╰─[0]: PatternBindingSyntax
     ├─pattern: IdentifierPatternSyntax
     │ ╰─identifier: identifier("assignedClosure")
     ├─typeAnnotation: TypeAnnotationSyntax
     │ ├─colon: colon
     │ ╰─type: IdentifierTypeSyntax
     │   ╰─name: identifier("String")
     ╰─initializer: InitializerClauseSyntax
       ├─equal: equal
       ╰─value: FunctionCallExprSyntax
         ├─calledExpression: ClosureExprSyntax
         │ ├─leftBrace: leftBrace
         │ ├─statements: CodeBlockItemListSyntax
         │ │ ╰─[0]: CodeBlockItemSyntax
         │ │   ╰─item: StringLiteralExprSyntax
         │ │     ├─openingQuote: stringQuote
         │ │     ├─segments: StringLiteralSegmentListSyntax
         │ │     │ ╰─[0]: StringSegmentSyntax
         │ │     │   ╰─content: stringSegment("a")
         │ │     ╰─closingQuote: stringQuote
         │ ╰─rightBrace: rightBrace
         ├─leftParen: leftParen
         ├─arguments: LabeledExprListSyntax
         ├─rightParen: rightParen
         ╰─additionalTrailingClosures: MultipleTrailingClosureElementListSyntax




 public static var computed: String { "b" }

 VariableDeclSyntax
 ├─attributes: AttributeListSyntax
 ├─modifiers: DeclModifierListSyntax
 │ ├─[0]: DeclModifierSyntax
 │ │ ╰─name: keyword(SwiftSyntax.Keyword.public)
 │ ╰─[1]: DeclModifierSyntax
 │   ╰─name: keyword(SwiftSyntax.Keyword.static)
 ├─bindingSpecifier: keyword(SwiftSyntax.Keyword.var)
 ╰─bindings: PatternBindingListSyntax
   ╰─[0]: PatternBindingSyntax
     ├─pattern: IdentifierPatternSyntax
     │ ╰─identifier: identifier("computed")
     ├─typeAnnotation: TypeAnnotationSyntax
     │ ├─colon: colon
     │ ╰─type: IdentifierTypeSyntax
     │   ╰─name: identifier("String")
     ╰─accessorBlock: AccessorBlockSyntax
       ├─leftBrace: leftBrace
       ├─accessors: CodeBlockItemListSyntax
       │ ╰─[0]: CodeBlockItemSyntax
       │   ╰─item: StringLiteralExprSyntax
       │     ├─openingQuote: stringQuote
       │     ├─segments: StringLiteralSegmentListSyntax
       │     │ ╰─[0]: StringSegmentSyntax
       │     │   ╰─content: stringSegment("b")
       │     ╰─closingQuote: stringQuote
       ╰─rightBrace: rightBrace
 */
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
