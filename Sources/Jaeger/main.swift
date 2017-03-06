import SwiftBuildkite
import Foundation

print("Hello World")

let b = SwiftBuildkite(token: "")
b.organizations { (orgs) in
    for org in orgs.organizations {
        print(org.name)
        print(org.pipelines_url?.absoluteString)
        print(org.created_at)
    }
}
print("Hello World")
