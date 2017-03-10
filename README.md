# jaeger

Jaeger is a Swift library for the [Buildkite API](https://buildkite.com/docs/rest-api) using the [Swift Package Manager](https://swift.org/package-manager).

### Background

This project is part of [52projects](https://donny.github.io/52projects/) and the new stuff that I learn through this project: [Buildkite API](https://buildkite.com/docs/rest-api) and [Swift Package Manager](https://swift.org/package-manager).

According to their GitHub integration [entry](https://github.com/integrations/buildkite): [Buildkite](https://buildkite.com) is a CI and build automation tool that combines the power of your own build infrastructure with the convenience of a managed, centralised web UI. The Buildkite open source agent is installable on any machine or network and provides a simple, repeatable process for running builds. And Buildkite's centralised web service handles agent monitoring, job distribution, integration with GitHub and Slack, and provides everyone on your team with an elegant interface for monitoring builds, tailing logs, and downloading artifacts.

### Project

Jaeger is a Swift library for the [Buildkite API](https://buildkite.com/docs/rest-api) and it requires a Buildkite authentication token that can be generated from the Buildkite dashboard. Jaeger can be used by client apps by specifying it as a dependency. An example of a [client](https://github.com/donny/jaeger/blob/master/Client) app is provided in the repository with the following `Package.swift`:

```swift
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
```

The library can be used to build, for example, a Swift Buildkite command-line interface to query Buildkite data. At the moment, Jaeger only provides `read-only` functions. A small Swift code to demonstrate the API usage is shown below:

```swift
import SwiftBuildkite
import Foundation

print("Example of using SwiftBuildkite\n")

let buildkiteToken = "xxx"
let b = SwiftBuildkite(token: buildkiteToken)

b.organizations { (result) in
    switch result {
    case .success(let value):
        for org in value.organizations {
            guard let date = org.created_at else { continue }            
            print("Organization Slug: \(org.slug) created at \(date)")
        }
    case .failure(let error):
        print(error)
    }
}

```

Screenshot of the example client usage:

![Screenshot](https://raw.githubusercontent.com/donny/jaeger/master/screenshot.png)

### Implementation

Jaeger is implemented using the [Swift](https://swift.org) programming language and utilising the [Swift Package Manager](https://swift.org/package-manager). It uses [KituraRequest](https://github.com/IBM-Swift/Kitura-Request) to make the HTTP calls to Buildkite and; uses [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) to parse the JSON responses and convert them to Swift data models.

As an example, take a look at the data model for [`Organization`](https://github.com/donny/jaeger/blob/master/Sources/SwiftBuildkite/Models/Organization.swift) and [`Organizations`](https://github.com/donny/jaeger/blob/master/Sources/SwiftBuildkite/Models/Organizations.swift).

### Conclusion

...
