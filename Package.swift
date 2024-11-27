// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "RainbowWalletSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "RainbowWalletSDK",
            targets: ["RainbowWalletSDK"]
        )
    ],
    targets: [
        .target(
            name: "RainbowWalletSDK",
            path: "ios/RainbowWalletSDK",
            exclude: ["Host", "Test"]
        ),
        .testTarget(
            name: "RainbowWalletSDKTests",
            dependencies: ["RainbowWalletSDK"],
            path: "ios/RainbowWalletSDK/Test"
        )
    ]
)
