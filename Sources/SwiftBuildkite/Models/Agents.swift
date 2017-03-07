import SwiftyJSON

public struct Agents {
    public let agents: [Agent]
    
    public init(json: JSON) {
        agents = json.arrayValue.map(Agent.init)
    }
}
