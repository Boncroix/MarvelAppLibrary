// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MarvelAppLibrary",
    platforms: [
                .iOS(.v16),
                .macOS(.v10_15)
               ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MarvelAppLibrary",
            targets: ["MarvelAppLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/evgenyneu/keychain-swift", .upToNextMajor(from: "20.0.0"))
    
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MarvelAppLibrary",
            dependencies: [
                .product(name: "KeychainSwift", package: "keychain-swift")
            ]
        ),
        
        .testTarget(
            name: "MarvelAppLibraryTests",
            dependencies: ["MarvelAppLibrary"]),
    ]
)
