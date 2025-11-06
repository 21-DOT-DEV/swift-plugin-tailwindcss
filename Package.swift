// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "swift-plugin-tailwindcss",
    products: [
        .executable(name: "tailwindcss", targets: ["TailwindExecutable"]),
        .plugin(name: "TailwindPlugin", targets: ["TailwindPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/21-DOT-DEV/swift-artifact-parser", exact: "0.0.1")
    ],
    targets: [
        .executableTarget(
            name: "TailwindExecutable",
            dependencies: [
                .product(name: "ArtifactParser", package: "swift-artifact-parser")
            ]
        ),
        .plugin(
            name: "TailwindPlugin",
            capability: .command(
                intent: .custom(
                    verb: "tailwindcss",
                    description: "Run TailwindCSS CLI commands."
                )
            ),
            dependencies: ["tailwindcss"]
        ),
//        .binaryTarget(name: "tailwindcss", path: "tailwindcss.artifactbundle.zip"),
        .binaryTarget(
            name: "tailwindcss",
            url: "https://github.com/21-DOT-DEV/swift-plugin-tailwindcss/releases/download/4.1.17/tailwindcss.artifactbundle.zip",
            checksum: "53b3b92acf933151d4f3fb374016f732be340ab5f241d108992cb6887be88f82"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
