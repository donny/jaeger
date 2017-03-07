import Foundation
import SwiftyJSON

public struct Agent {
    public let id: String
    public let url: URL?
    public let web_url: URL?
    public let name: String
    public let connection_state: String
    public let access_token: String
    public let hostname: String
    public let ip_address: String
    public let user_agent: String
    public let version: String
    public let created_at: Date?

    public init(json: JSON) {
        id = json["id"].stringValue
        url = URL(string: json["url"].stringValue)
        web_url = URL(string: json["web_url"].stringValue)        
        name = json["name"].stringValue
        connection_state = json["connection_state"].stringValue
        access_token = json["access_token"].stringValue
        hostname = json["hostname"].stringValue
        ip_address = json["ip_address"].stringValue
        user_agent = json["user_agent"].stringValue
        version = json["version"].stringValue
        created_at = json["created_at"].stringValue.toDate()
    }
}
