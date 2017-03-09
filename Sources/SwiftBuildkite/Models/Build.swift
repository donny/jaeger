import Foundation
import SwiftyJSON

public enum BuildState: String {
    case running, scheduled, passed, failed, blocked, canceled, canceling, skipped, finished
    case notRun = "not_run"
    case unknown
}

public struct Build {
    public let id: String
    public let url: URL?
    public let web_url: URL?
    public let number: Int
    public let state: BuildState
    public let message: String
    public let commit: String
    public let branch: String
    public let source: String
    public let created_at: Date?
    public let scheduled_at: Date?
    public let started_at: Date?
    public let finished_at: Date?
    public let pipeline: Pipeline
    
    public init(json: JSON) {
        id = json["id"].stringValue
        url = URL(string: json["url"].stringValue)
        web_url = URL(string: json["web_url"].stringValue)
        number = json["number"].intValue
        state = BuildState(rawValue: json["state"].stringValue) ?? BuildState.unknown
        message = json["message"].stringValue
        commit = json["commit"].stringValue
        branch = json["branch"].stringValue
        source = json["source"].stringValue
        created_at = json["created_at"].stringValue.toDate()
        scheduled_at = json["scheduled_at"].stringValue.toDate()
        started_at = json["started_at"].stringValue.toDate()
        finished_at = json["finished_at"].stringValue.toDate()
        pipeline = Pipeline.init(json: json["pipeline"])
    }
}
