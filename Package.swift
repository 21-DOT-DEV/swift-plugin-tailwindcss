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
            url: "https://github.com/21-DOT-DEV/swift-plugin-tailwindcss/releases/download/4.2.2/tailwindcss.artifactbundle.zip",
            checksum: "e2b39d36684769f69c997ce3fc2aeb3018ed2cb768df07b9f20d06440c925267"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
