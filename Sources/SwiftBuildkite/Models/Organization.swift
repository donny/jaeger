import Foundation
import SwiftyJSON

public struct Organization {
    public let id: String
    public let url: URL?
    public let web_url: URL?
    public let name: String
    public let slug: String
    public let pipelines_url: URL?
    public let agents_url: URL?
    public let emojis_url: URL?
    public let created_at: Date?
    
    public init(json: JSON) {
        id = json["id"].stringValue
        url = URL(string: json["url"].stringValue)
        web_url = URL(string: json["web_url"].stringValue)
        name = json["name"].stringValue
        slug = json["slug"].stringValue
        pipelines_url = URL(string: json["pipelines_url"].stringValue)
        agents_url = URL(string: json["agents_url"].stringValue)
        emojis_url = URL(string: json["emojis_url"].stringValue)
        created_at = json["created_at"].stringValue.toDate()
    }
}
