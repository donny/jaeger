import SwiftyJSON

public struct Pipelines {
    public let pipelines: [Pipeline]
    
    public init(json: JSON) {
        pipelines = json.arrayValue.map(Pipeline.init)
    }
}
