import SwiftBuildkite
import Foundation

print("Hello World")

let b = SwiftBuildkite(token: "")
b.organizations { (orgs) in
    for org in orgs.organizations {
        print(org.slug)
        if let date = org.created_at {
            print(date)
        }
        
        if let string = org.pipelines_url?.absoluteString {
            print(string)
        }
    }
}

b.pipeline("rea", "resi-mobile-ios") { (pipeline) in
    print(pipeline)
}

b.build("rea", "resi-mobile-ios", 4793) { (build) in
    print(build)
}

print("Hello World")
