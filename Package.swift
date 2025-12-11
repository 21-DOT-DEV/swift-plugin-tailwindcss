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
            url: "https://github.com/21-DOT-DEV/swift-plugin-tailwindcss/releases/download/3.4.19/tailwindcss.artifactbundle.zip",
            checksum: "c8003426a0e63c1e01ae1dcaa462a362978dfcc4d6925676d835c1e97348d347"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
