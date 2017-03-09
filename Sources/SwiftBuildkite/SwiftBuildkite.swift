import KituraRequest
import SwiftyJSON

public enum SwiftBuildkiteError: Error {
    case clientError(code: Int)
    case serverError(code: Int)
    case unknownError(code: Int)
}

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

public class SwiftBuildkite {
    private let token: String
    private let endpoint = "https://api.buildkite.com/v2"
    
    public init(token: String) {
        self.token = token
    }
    
    private func request(_ method: Request.Method, _ URL: String, parameters: Request.Parameters? = nil,
                         callback: @escaping (Result<JSON>) -> Void) -> Void {
        KituraRequest.request(method, endpoint + URL,
                              parameters: parameters,
                              headers: ["Authorization": "Bearer \(token)"]
        ).response { request, response, data, error in
            if let error = error {
                callback(Result.failure(error))
                return
            }
            
            if let code = response?.statusCode.rawValue {
                switch code {
                case 200:
                    break
                case 400...499:
                    callback(Result.failure(SwiftBuildkiteError.clientError(code: code)))
                    return
                case 500...599:
                    callback(Result.failure(SwiftBuildkiteError.serverError(code: code)))
                    return
                default:
                    callback(Result.failure(SwiftBuildkiteError.unknownError(code: code)))
                    return
                }
            }

            guard let data = data else { return /* callback() */ }
            callback(Result.success(JSON(data: data)))
        }
    }
    
    // Organizations
    
    public func organizations(parameters: [String: Any]? = nil, callback: @escaping (Result<Organizations>) -> Void) -> Void {
        request(.get, "/organizations", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Organizations(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
    
    public func organization(_ orgSlug: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Organization>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Organization(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }

    // Pipelines
    
    public func pipelines(_ orgSlug: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Pipelines>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Pipelines(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }

    public func pipeline(_ orgSlug: String, _ slug: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Pipeline>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(slug)", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Pipeline(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
    
    // Builds

    public func builds(parameters: [String: Any]? = nil, callback: @escaping (Result<Builds>) -> Void) -> Void {
        request(.get, "/builds", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Builds(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
    
    public func builds(_ orgSlug: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Builds>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/builds", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Builds(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
    
    public func builds(_ orgSlug: String, _ pipeSlug: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Builds>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Builds(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }

    public func build(_ orgSlug: String, _ pipeSlug: String, _ number: Int, parameters: [String: Any]? = nil, callback: @escaping (Result<Build>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Build(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
    
    // Agents
    
    public func agents(_ orgSlug: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Agents>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/agents", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Agents(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
    
    public func agent(_ orgSlug: String, _ id: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Agent>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/agents/\(id)", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Agent(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
    
    // Artifacts

    public func artifacts(_ orgSlug: String, _ pipeSlug: String, _ number: Int, parameters: [String: Any]? = nil, callback: @escaping (Result<Artifacts>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/artifacts", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Artifacts(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
    
    public func artifacts(_ orgSlug: String, _ pipeSlug: String, _ number: Int, _ id: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Artifacts>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/jobs/\(id)/artifacts", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Artifacts(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }

    public func artifact(_ orgSlug: String, _ pipeSlug: String, _ number: Int, _ id: String, parameters: [String: Any]? = nil, callback: @escaping (Result<Artifact>) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/artifacts/\(id)", parameters: parameters) { result in
            switch result {
            case .success(let value):
                callback(Result.success(Artifact(json: value)))
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }

}
