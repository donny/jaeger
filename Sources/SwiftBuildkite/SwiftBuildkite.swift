import KituraRequest
import SwiftyJSON

public class SwiftBuildkite {
    private let token: String
    private let endpoint = "https://api.buildkite.com/v2"
    
    public init(token: String) {
        self.token = token
    }
    
    private func request(_ method: Request.Method, _ URL: String, parameters: Request.Parameters? = nil) -> Request {
        return KituraRequest.request(method, endpoint + URL, parameters: parameters,
                    encoding: JSONEncoding.default,
                    headers: ["Authorization": "Bearer \(token)"])
    }
    
    // Organizations
    
    public func organizations(callback: @escaping (Organizations) -> Void) -> Void {
        request(.get, "/organizations"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let orgs = Organizations(json: JSON(data: data))
            callback(orgs)
        }
    }
    
    public func organization(_ orgSlug: String, callback: @escaping (Organization) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let org = Organization(json: JSON(data: data))
            callback(org)
        }
    }

    // Pipelines
    
    public func pipelines(_ orgSlug: String, callback: @escaping (Pipelines) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let pipelines = Pipelines(json: JSON(data: data))
            callback(pipelines)
        }
    }

    public func pipeline(_ orgSlug: String, _ slug: String, callback: @escaping (Pipeline) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(slug)"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let pipeline = Pipeline(json: JSON(data: data))
            callback(pipeline)
        }
    }
    
    // Builds

    public func builds(callback: @escaping (Builds) -> Void) -> Void {
        request(.get, "/builds"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let builds = Builds(json: JSON(data: data))
            callback(builds)
        }
    }
    
    public func builds(_ orgSlug: String, callback: @escaping (Builds) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/builds"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let builds = Builds(json: JSON(data: data))
            callback(builds)
        }
    }
    
    public func builds(_ orgSlug: String, _ pipeSlug: String, callback: @escaping (Builds) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let builds = Builds(json: JSON(data: data))
            callback(builds)
        }
    }

    public func build(_ orgSlug: String, _ pipeSlug: String, _ number: Int, callback: @escaping (Build) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let build = Build(json: JSON(data: data))
            callback(build)
        }
    }
    
    // Agents
    
    public func agents(_ orgSlug: String, callback: @escaping (Agents) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/agents"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let agents = Agents(json: JSON(data: data))
            callback(agents)
        }
    }
    
    public func agent(_ orgSlug: String, _ id: String, callback: @escaping (Agent) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/agents/\(id)"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let agent = Agent(json: JSON(data: data))
            callback(agent)
        }
    }
    
    // Artifacts

    public func artifacts(_ orgSlug: String, _ pipeSlug: String, _ number: Int, callback: @escaping (Artifacts) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/artifacts"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let artifacts = Artifacts(json: JSON(data: data))
            callback(artifacts)
        }
    }
    
    public func artifacts(_ orgSlug: String, _ pipeSlug: String, _ number: Int, _ id: String, callback: @escaping (Artifacts) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/jobs/\(id)/artifacts"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let artifacts = Artifacts(json: JSON(data: data))
            callback(artifacts)
        }
    }

    public func artifact(_ orgSlug: String, _ pipeSlug: String, _ number: Int, _ id: String, callback: @escaping (Artifact) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/artifacts/\(id)"
        ).response { request, response, data, error in
            guard let data = data else { return }
            let artifact = Artifact(json: JSON(data: data))
            callback(artifact)
        }
    }

}
