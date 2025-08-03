//
//  TailwindCSSPlugin.swift
//  21-DOT-DEV/swift-plugin-tailwindcss
//
//  Copyright (c) 2025 21.dev
//  Distributed under the MIT software license
//
//  See the accompanying file LICENSE for information
//

import Foundation
import PackagePlugin

@main
struct TailwindCSSPlugin: CommandPlugin {
    func performCommand(
        context: PackagePlugin.PluginContext,
        arguments: [String]
    ) async throws {
        let binary = try context.tool(named: "tailwindcss")
        let process = Process()

        process.executableURL = URL(filePath: binary.path.string)
        process.arguments = arguments

        try process.run()
        process.waitUntilExit()

        // Check whether the `tailwindcss` invocation was successful.
        guard process.terminationReason == .exit && process.terminationStatus == 0 else {
            Diagnostics.error("""
                'tailwindcss' invocation failed with a nonzero exit code: '\(process.terminationStatus)'.

                See 'swift package plugin tailwindcss --help' for details.
                """
            )

            return
        }
    }
}
