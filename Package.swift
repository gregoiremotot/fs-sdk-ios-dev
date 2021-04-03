// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "fs_ios_sdk",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "fs_ios_sdk",
            targets: ["fs_ios_sdk_wrapper"])
    ],
    dependencies: [
        .package(name: "SocketIO", url: "https://github.com/socketio/socket.io-client-swift", .upToNextMinor(from: "16.0.0")),
        .package(name: "Facebook", url: "https://github.com/facebook/facebook-ios-sdk", .upToNextMinor(from: "9.1.0"))
    ],
    targets: [
        .target(
            name: "fs_ios_sdk_wrapper",
            dependencies: [
                .product(name: "FacebookLogin", package: "Facebook"),
                .product(name: "SocketIO", package: "SocketIO"),
                .target(name: "fs_ios_sdk")
            ],
            path: "Sources/Wrapper",
            publicHeadersPath: ""
        ),
        .binaryTarget(
            name: "fs_ios_sdk",
            path: "fs_ios_sdk.xcframework")
    ])