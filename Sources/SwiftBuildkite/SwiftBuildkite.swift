import KituraRequest
import SwiftyJSON

public class SwiftBuildkite {
    private let token: String
    private let endpoint = "https://api.buildkite.com/v2"
    
    public init(token: String) {
        self.token = token
    }
    
    private func request(_ method: Request.Method, _ URL: String, parameters: Request.Parameters? = nil, callback: @escaping (JSON) -> Void) -> Void {
        KituraRequest.request(method, endpoint + URL,
                              parameters: parameters,
                              encoding: JSONEncoding.default,
                              headers: ["Authorization": "Bearer \(token)"]
        ).response { request, response, data, error in
            guard let data = data else { return }
            callback(JSON(data: data))
        }
    }
    
    // Organizations
    
    public func organizations(callback: @escaping (Organizations) -> Void) -> Void {
        request(.get, "/organizations") { json in
            let orgs = Organizations(json: json)
            callback(orgs)
        }
    }
    
    public func organization(_ orgSlug: String, callback: @escaping (Organization) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)") { json in
            let org = Organization(json: json)
            callback(org)
        }
    }

    // Pipelines
    
    public func pipelines(_ orgSlug: String, callback: @escaping (Pipelines) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines") { json in
            let pipelines = Pipelines(json: json)
            callback(pipelines)
        }
    }

    public func pipeline(_ orgSlug: String, _ slug: String, callback: @escaping (Pipeline) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(slug)") { json in
            let pipeline = Pipeline(json: json)
            callback(pipeline)
        }
    }
    
    // Builds

    public func builds(callback: @escaping (Builds) -> Void) -> Void {
        request(.get, "/builds") { json in
            let builds = Builds(json: json)
            callback(builds)
        }
    }
    
    public func builds(_ orgSlug: String, callback: @escaping (Builds) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/builds") { json in
            let builds = Builds(json: json)
            callback(builds)
        }
    }
    
    public func builds(_ orgSlug: String, _ pipeSlug: String, callback: @escaping (Builds) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds") { json in
            let builds = Builds(json: json)
            callback(builds)
        }
    }

    public func build(_ orgSlug: String, _ pipeSlug: String, _ number: Int, callback: @escaping (Build) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)") { json in
            let build = Build(json: json)
            callback(build)
        }
    }
    
    // Agents
    
    public func agents(_ orgSlug: String, callback: @escaping (Agents) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/agents") { json in
            let agents = Agents(json: json)
            callback(agents)
        }
    }
    
    public func agent(_ orgSlug: String, _ id: String, callback: @escaping (Agent) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/agents/\(id)") { json in
            let agent = Agent(json: json)
            callback(agent)
        }
    }
    
    // Artifacts

    public func artifacts(_ orgSlug: String, _ pipeSlug: String, _ number: Int, callback: @escaping (Artifacts) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/artifacts") { json in
            let artifacts = Artifacts(json: json)
            callback(artifacts)
        }
    }
    
    public func artifacts(_ orgSlug: String, _ pipeSlug: String, _ number: Int, _ id: String, callback: @escaping (Artifacts) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/jobs/\(id)/artifacts") { json in
            let artifacts = Artifacts(json: json)
            callback(artifacts)
        }
    }

    public func artifact(_ orgSlug: String, _ pipeSlug: String, _ number: Int, _ id: String, callback: @escaping (Artifact) -> Void) -> Void {
        request(.get, "/organizations/\(orgSlug)/pipelines/\(pipeSlug)/builds/\(number)/artifacts/\(id)") { json in
            let artifact = Artifact(json: json)
            callback(artifact)
        }
    }

}
