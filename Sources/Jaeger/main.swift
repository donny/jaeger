import SwiftBuildkite

print("Hello World")

let b = SwiftBuildkite()
b.test { (orgs) in
    for org in orgs.organizations {
        print(org.name)
    }
}
print("Hello World")
