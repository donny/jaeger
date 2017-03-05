import PackageDescription

let package = Package(
    name: "jaeger",
    targets: [
        Target(name: "SwiftBuildkite"),
        Target(name: "Jaeger", dependencies: [.Target(name: "SwiftBuildkite")])
    ]
)
