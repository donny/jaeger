import SwiftyJSON

public struct Artifacts {
    public let artifacts: [Artifact]
    
    public init(json: JSON) {
        artifacts = json.arrayValue.map(Artifact.init)
    }
}
