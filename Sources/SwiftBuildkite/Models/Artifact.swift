import Foundation
import SwiftyJSON

public struct Artifact {
    public let id: String
    public let job_id: String
    public let url: URL?
    public let download_url: URL?
    public let state: String
    public let path: String
    public let dirname: String
    public let filename: String
    public let mime_type: String
    public let file_size: Int
    public let glob_path: String
    public let original_path: String
    public let sha1sum: String
    
    public init(json: JSON) {
        id = json["id"].stringValue
        job_id = json["job_id"].stringValue
        url = URL(string: json["url"].stringValue)
        download_url = URL(string: json["download_url"].stringValue)
        state = json["state"].stringValue
        path = json["path"].stringValue
        dirname = json["dirname"].stringValue
        filename = json["filename"].stringValue
        mime_type = json["mime_type"].stringValue
        file_size = json["file_size"].intValue
        glob_path = json["glob_path"].stringValue
        original_path = json["original_path"].stringValue
        sha1sum = json["sha1sum"].stringValue
    }
}
