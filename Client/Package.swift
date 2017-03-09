import PackageDescription

let package = Package(
    name: "jaeger",
    targets: [
        Target(name: "Jaeger")
    ],
    dependencies: [
        .Package(url: "https://github.com/donny/jaeger.git", majorVersion: 0, minor: 1)
    ]
)
