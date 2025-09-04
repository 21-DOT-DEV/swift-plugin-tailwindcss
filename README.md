# swift-plugin-tailwindcss

A Swift plugin that integrates [TailwindCSS](https://github.com/tailwindlabs/tailwindcss), the utility-first CSS framework for rapidly building custom designs.

## Features

- **Standalone CLI Integration**: Direct access to TailwindCSS CLI commands through Swift Package Manager.
- **Cross-platform Support**: Works seamlessly across macOS, Linux, and Windows environments.
- **No Node.js Required**: Use TailwindCSS without needing a Node.js environment or npm dependencies.
- **Swift Package Manager Integration**: Native integration with SPM workflow and toolchain.

## Installation

### Using Swift Package Manager plugin

To utilize the `swift-plugin-tailwindcss`, include it in the target specification of your Swift Package:

```swift
// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "YourPackageName",
    dependencies: [
        .package(url: "https://github.com/21-DOT-DEV/swift-plugin-tailwindcss.git", exact: "4.1.13"),
    ],
    targets: [
        .executableTarget(name: "YourTargetName")
    ]
)
```

This configuration provides the minimum setup required to invoke TailwindCSS from the command line, enabling its integration into your Swift project workflows.

### Using [Mint](https://github.com/yonaskolb/Mint)

```
$ mint install 21-DOT-DEV/swift-plugin-tailwindcss
```

## Commands

After TailwindCSS is [installed](#installation) in your Swift package, you can start using it.

### Using Swift Package Manager plugin

Invoke the plugin directly using the `swift package <PLUGIN>` command:

```bash
swift package tailwindcss --help
```

Generate CSS from your input file:

```bash
swift package --disable-sandbox tailwindcss -i input.css -o output.css
```

> [!IMPORTANT]  
> The TailwindCSS plugin requires the `--disable-sandbox` flag with the Swift Package Manager due to its need to read input files and write output files in your local directory.

To run other TailwindCSS commands within your package repository:

```bash
swift package --disable-sandbox tailwindcss <command>
```

> [!NOTE]  
> For a detailed understanding of TailwindCSS commands and their usage, refer to [TailwindCSS's official documentation](https://tailwindcss.com/docs/cli).

### Using `mint`

After running `mint install 21-DOT-DEV/swift-plugin-tailwindcss` to install the CLI tool, anytime you want to interact with TailwindCSS, simply run:

```
mint run 21-DOT-DEV/swift-plugin-tailwindcss <command>
```

Example:

```
mint run 21-DOT-DEV/swift-plugin-tailwindcss --help
```

## Configuration

### Replacing npm/npx workflow

If you're migrating from a Node.js-based TailwindCSS setup, you can replace your npm/npx commands with the Swift plugin equivalents:

**Traditional npm/npx approach:**
```bash
npx tailwindcss -i tailwind.css -o ./site/output.css --minify
```

**Swift plugin approach:**
```bash
swift package --disable-sandbox tailwindcss -i tailwind.css -o ./site/output.css --minify
```

### Basic setup

Create a `tailwind.css` input file in the root of your package:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

For TailwindCSS v4+, you can use the new `@import` syntax:

```css
@import "tailwindcss";
```

Then generate your CSS:

```bash
swift package --disable-sandbox tailwindcss -i tailwind.css -o output.css --minify
```

> [!TIP]  
> For more advanced TailwindCSS configurations and usage patterns, refer to [TailwindCSS's official guides](https://tailwindcss.com/docs/installation).

## Community and Support

If you encounter any issues or have questions regarding the `swift-plugin-tailwindcss`, please open an issue on GitHub. Contributions, suggestions, and feedback are always welcome!

## Acknowledgments

Special thanks to the original [TailwindCSS](https://github.com/tailwindlabs/tailwindcss) project and its contributors for creating a powerful utility-first CSS framework.