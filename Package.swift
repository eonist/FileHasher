import PackageDescription

let package = Package(
    name: "FileHasher",
    products: [
        .library(
            name: "FileHasher",
            targets: ["FileHasher"])
    ],
    dependencies: [
        .package(url: "https://github.com/eonist/ResourceHelper.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "FileHasher",
         dependencies: []),
        .testTarget(
            name: "FileHasherTests",
            dependencies: ["FileHasher", "ResourceHelper"])
    ]
)
