import SwiftyJSON

public struct Builds {
    public let builds: [Build]
    
    public init(json: JSON) {
        builds = json.arrayValue.map(Build.init)
    }
}
