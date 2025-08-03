//
//  Main.swift
//  21-DOT-DEV/swift-plugin-tailwindcss
//
//  Copyright (c) 2025 21.dev
//  Distributed under the MIT software license
//
//  See the accompanying file LICENSE for information
//

import ArtifactParser
import Foundation

@main
struct TailwindExecutable {
    static func main() async throws {
        // Get arguments that were passed into this executable and will be forwarded to tailwind as args.
        let tailwindArgs = Array(ProcessInfo.processInfo.arguments.dropFirst())

        // Get the current directory name to use as the repository name for finding the binary.
        guard let currentDirectory = FileManager.default.currentDirectoryPath.components(separatedBy: "/").last,
              let binaryPath = ArtifactParser.getPathToBinary(
                binaryName: "tailwindcss",
                repositoryName: currentDirectory
              ) else {
            print("Error: Unable to find tailwindcss binary.")
            exit(1)
        }

        // Run tailwind binary with the arguments that were passed into this executable.
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = [binaryPath] + tailwindArgs

        do {
            try process.run()
            process.waitUntilExit()
        } catch {
            print("Error running process: \(error)")
        }
    }
}
