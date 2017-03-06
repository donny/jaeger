import SwiftyJSON

public struct Organizations {
    public let organizations: [Organization]
    public init(json: JSON) {
        organizations = json.arrayValue.map(Organization.init)
    }
}
