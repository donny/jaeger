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
            guard let agents_url = org.agents_url else { continue }
            guard let pipelines_url = org.pipelines_url else { continue }
            
            print("Organization Slug: \(org.slug) created at \(date)")
            print("Created at: \(date)")
            print("Agents URL: \(agents_url)")
            print("Pipelines URL: \(pipelines_url)")
        }
    case .failure(let error):
        print(error)
    }
}
