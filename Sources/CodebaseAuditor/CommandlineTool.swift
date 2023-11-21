import Foundation
import CodebaseCore
import ArgumentParser

@main
struct MutableStaticVariables: AsyncParsableCommand {
    @Argument(transform: URL.init(fileURLWithPath:))
    var path: URL

    func run() async throws {

        let resourceKeys: Set<URLResourceKey> = [.nameKey, .isDirectoryKey]
        let directoryEnumerator = FileManager.default.enumerator(
            at: path,
            includingPropertiesForKeys: Array(resourceKeys),
            options: .skipsHiddenFiles
        )!

        try await withThrowingTaskGroup(of: [String].self) { group in

            for case let fileURL as URL in directoryEnumerator {
                guard let resourceValues = try? fileURL.resourceValues(forKeys: resourceKeys),
                      let isDirectory = resourceValues.isDirectory,
                      let name = resourceValues.name
                else { continue }

                if isDirectory == false, name.hasSuffix(".swift") {
                    group.addTask {
                        let source = try String(contentsOf: fileURL, encoding: .utf8)
                        let result = Query.mutableStaticVariables(code: source, fileName: fileURL.lastPathComponent)
                        return result.map { $0.0.trimmedDescription }
                    }
                }
            }

            for try await result in group {
                result.forEach {
                    print($0)
                }
            }

        }
    }
}
