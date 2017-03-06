import SwiftyJSON

public struct Organization {
    public let name: String
    public init(json: JSON) {
        name = json["name"].stringValue
    }
}
