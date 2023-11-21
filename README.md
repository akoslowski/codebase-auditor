# CodebaseAuditor

A simple attempt to find `mutable static variable declarations` in Swift code.

## Examples of VariableDeclSyntax

`public static var implicitlyUnwrapped: Foo!`

```log
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
```

---

`public static var assignedStatic = Self.default`

```log
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
```

---

`public static var computed: String { "a" }`

```log
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
```

---

`public static var assignedClosure: String = { "a" }()`

```log
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
```

---

`public static var computed: String { "b" }`

```log
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
```
