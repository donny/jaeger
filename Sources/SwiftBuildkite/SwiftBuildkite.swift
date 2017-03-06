import KituraRequest
import SwiftyJSON

public class SwiftBuildkite {
    public let text = "Hello, Buildkite!"
    
    public init() {
    }
    
    public func test(callback: @escaping (Organizations) -> Void) -> Void {
        KituraRequest.request(.get,
            "https://api.buildkite.com/v2/organizations",
            parameters: [:],
            encoding: JSONEncoding.default,
            ).response { request, response, data, error in
                guard let data = data else { return }
                let json = JSON(data: data)
                let org = Organizations(json: json)
                callback(org)
        }
    }
}
