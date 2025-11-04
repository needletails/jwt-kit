// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "jwt-kit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v15),
        .watchOS(.v8),
    ],
    products: [
        .library(name: "JWTKit", targets: ["JWTKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/needletails/swift-crypto.git", branch: "trait/force-build-swift-crypto-api", traits: ["FORCE_BUILD_SWIFT_CRYPTO_API"]),
        .package(url: "https://github.com/needletails/swift-certificates.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "JWTKit",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "CryptoExtras", package: "swift-crypto"),
                .product(name: "X509", package: "swift-certificates"),
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .testTarget(
            name: "JWTKitTests",
            dependencies: [
                "JWTKit"
            ]
        ),
    ]
)
