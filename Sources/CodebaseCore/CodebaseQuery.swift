import Foundation
import SwiftSyntax
import SwiftParser

public struct Query {

    public typealias QueryResult = (VariableDeclSyntax, SourceLocation)

    public static func mutableStaticVariables(
        code: String,
        fileName: String
    ) -> [(VariableDeclSyntax, SourceLocation)] {
        let sourceFile = Parser.parse(source: code)
        let sourceLocationConverter = SourceLocationConverter(
            fileName: fileName,
            tree: sourceFile
        )

        return sourceFile
            .statements
            .flatMap { $0.mutableStaticVariables() }
            .map { ($0, $0.startLocation(converter: sourceLocationConverter)) }
    }
}

extension MemberBlockSyntax {
    func mutableStaticVariables() -> [VariableDeclSyntax] {
        members
            .compactMap { $0.decl.as(VariableDeclSyntax.self) }
            .filter { $0.isMutableStatic }
    }
}

extension VariableDeclSyntax {
    var isMutableStatic: Bool {
        guard bindingSpecifier.text == "var" else { return false }

        guard modifiers.contains(where: { $0.name.text == "static" }) else { return false }

        // `static var computed: String { "b" }` is not mutable
        if bindings.contains(where: { $0.accessorBlock != nil }) { return false }

        return true
    }
}

extension CodeBlockItemSyntax {
    func mutableStaticVariables() -> [VariableDeclSyntax] {
        switch item {
        case .decl(let declaration) where declaration.is(StructDeclSyntax.self):
            declaration.as(StructDeclSyntax.self)!
                .memberBlock
                .mutableStaticVariables()

        case .decl(let declaration) where declaration.is(ClassDeclSyntax.self):
            declaration.as(ClassDeclSyntax.self)!
                .memberBlock
                .mutableStaticVariables()

        case .decl(let declaration) where declaration.is(EnumDeclSyntax.self):
            declaration.as(EnumDeclSyntax.self)!
                .memberBlock
                .mutableStaticVariables()

        case .decl(let declaration) where declaration.is(VariableDeclSyntax.self):
            if let variableDecl = declaration.as(VariableDeclSyntax.self), variableDecl.isMutableStatic {
                [variableDecl]
            } else {
                []
            }

        default:
            []
        }
    }
}
