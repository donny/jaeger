import PackageDescription

let package = Package(
    name: "jaeger",
    targets: [
        Target(name: "SwiftBuildkite"),
        Target(name: "Jaeger", dependencies: [.Target(name: "SwiftBuildkite")])
    ],
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura-Request.git", majorVersion: 0, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 15, minor: 0),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1, minor: 6)
    ]
)
