import Foundation
import SwiftyJSON

public struct Pipeline {
    public let id: String
    public let url: URL?
    public let web_url: URL?
    public let name: String
    public let slug: String
    public let repository: String
    public let builds_url: URL?
    public let badge_url: URL?
    public let created_at: Date?
    public let scheduled_builds_count: Int
    public let running_builds_count: Int
    public let scheduled_jobs_count: Int
    public let running_jobs_count: Int
    public let waiting_jobs_count: Int
    
    public init(json: JSON) {
        id = json["id"].stringValue
        url = URL(string: json["url"].stringValue)
        web_url = URL(string: json["web_url"].stringValue)
        name = json["name"].stringValue
        slug = json["slug"].stringValue
        repository = json["repository"].stringValue
        builds_url = URL(string: json["builds_url"].stringValue)
        badge_url = URL(string: json["badge_url"].stringValue)
        created_at = json["created_at"].stringValue.toDate()
        scheduled_builds_count = json["scheduled_builds_count"].intValue
        running_builds_count = json["running_builds_count"].intValue
        scheduled_jobs_count = json["scheduled_jobs_count"].intValue
        running_jobs_count = json["running_jobs_count"].intValue
        waiting_jobs_count = json["waiting_jobs_count"].intValue
    }
}
