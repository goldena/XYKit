// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XYKit",
    
    platforms: [.iOS(.v12)],
    
    products: [
        .library(
            name: "XYKit",
            targets: ["XYKit"]),
    ],
    
    targets: [
        .target(
            name: "XYKit",
            dependencies: []),
    
        .testTarget(
            name: "XYKitTests",
            dependencies: ["XYKit"]),
    ]
)
