import PackageDescription

let package = Package(
    name: "client",
    targets: [
        Target(name: "Client")
    ],
    dependencies: [
        .Package(url: "https://github.com/donny/jaeger.git", majorVersion: 0, minor: 1)
    ]
)
