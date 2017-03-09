import SwiftBuildkite
import Foundation

print("Hello World")

let b = SwiftBuildkite(token: "")
//b.organizations { (result) in
//    switch result {
//    case .success(let value):
//        for org in value.organizations {
//            print(org.slug)
//            if let date = org.created_at {
//                print(date)
//            }
//
//            if let string = org.pipelines_url?.absoluteString {
//                print(string)
//            }
//        }
//    case .failure(let error):
//        print(error)
//    }
//}

//b.pipeline("rea", "resi-mobile-ios") { (pipeline) in
//    print(pipeline)
//}


b.builds("rea", "resi-mobile-ios", parameters: ["state": "passed"]) { (result) in
    switch result {
    case .success(let value):
        for org in value.builds {
            print("\(org.number): \(org.state)")
        }
    case .failure(let error):
        print(error)
    }
}

print("Hello World")
