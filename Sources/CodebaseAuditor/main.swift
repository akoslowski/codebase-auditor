import Foundation
import CodebaseCore

func main() throws {
    let file = "/Users/andreas.koslowski/repositories/XING/ios-app/libraries/XNGNativeAdvertising/Sources/NativeAdvertisingModule.swift"
    let url = URL(fileURLWithPath: file)
    let source = try String(contentsOf: url, encoding: .utf8)

    let result = Query.staticVariablesWithValueAssignment(code: source, fileName: url.lastPathComponent)
    print("-----------")
    print(result)
}

try main()
