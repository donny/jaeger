import KituraRequest
import SwiftyJSON

public class SwiftBuildkite {
    private let token: String
    
    public init(token: String) {
        self.token = token
    }
    
    private func request(_ method: Request.Method, _ URL: String, parameters: Request.Parameters? = nil) -> Request {
        return KituraRequest.request(method, URL, parameters: parameters,
                    encoding: JSONEncoding.default,
                    headers: ["Authorization": "Bearer \(token)"])
    }
    
    public func organizations(callback: @escaping (Organizations) -> Void) -> Void {
        request(.get, "https://api.buildkite.com/v2/organizations"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let orgs = Organizations(json: JSON(data: data))
            callback(orgs)
        }
    }
}
