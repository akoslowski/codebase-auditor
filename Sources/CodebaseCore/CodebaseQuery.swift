import Foundation
import SwiftSyntax
import SwiftParser

public struct Query {

    public typealias QueryResult = (MemberBlockItemListSyntax, SourceLocation)

    public static func staticVariablesWithValueAssignment(code: String, fileName: String) -> [String] {
        let sourceFile = Parser.parse(source: code)

        var list = [QueryResult]()

        sourceFile.statements.forEach { block in
            switch block.item {
            case .decl(let decl):

                if let container = decl.as(StructDeclSyntax.self) {
                    let variables = container.memberBlock.staticVariablesWithValueAssignment()
                    let location = variables.startLocation(converter: .init(fileName: fileName, tree: sourceFile), afterLeadingTrivia: true)
                    list.append((variables, location))
                }


                if let container = decl.as(ClassDeclSyntax.self) {
                    let variables = container.memberBlock.staticVariablesWithValueAssignment()
                    let location = variables.startLocation(converter: .init(fileName: fileName, tree: sourceFile), afterLeadingTrivia: true)
                    list.append((variables, location))
                }

                if let container = decl.as(EnumDeclSyntax.self) {
                    let variables = container.memberBlock.staticVariablesWithValueAssignment()
                    let location = variables.startLocation(converter: .init(fileName: fileName, tree: sourceFile), afterLeadingTrivia: true)
                    list.append((variables, location))
                }

                if let variableDeclaration = decl.as(VariableDeclSyntax.self) {
                    let isVar = variableDeclaration.bindingSpecifier.text == "var"
                    let hasStatic = variableDeclaration.modifiers.first(where: { modif in
                        modif.name.text == "static"
                    }) != nil
                    guard isVar, hasStatic else { return }

                    let location = variableDeclaration.startLocation(converter: .init(fileName: fileName, tree: sourceFile), afterLeadingTrivia: true)
                    print("Cannot store \(variableDeclaration)")
                    //list.append((variableDeclaration, location))
                }


            default:
                break
            }
        }

        return list.flatMap { $0.0.map { a in a.trimmed.description } }
    }
}

extension MemberBlockSyntax {
    func staticVariablesWithValueAssignment() -> MemberBlockItemListSyntax {
        members.filter {
            $0.decl.isStaticVariableWithValueAssignment()
        }
    }
}

extension DeclSyntax {
    func isStaticVariableWithValueAssignment() -> Bool {
        guard let varDecl = self.as(VariableDeclSyntax.self) else { return false }

        let isVar = varDecl.bindingSpecifier.text == "var"
        guard isVar else { return false }

        guard let _ = varDecl.modifiers.first(where: { modif in
            modif.name.text == "static" //.keyword(SwiftSyntax.Keyword.static)
        }) else { return false }

        return true
    }
}

