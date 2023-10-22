import Foundation

struct BookResult: Decodable {
    let results: [BookCategory]
}

struct BookCategory: Decodable {
    let listName: String
    let oldestPublishedDate: String
    
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case oldestPublishedDate = "oldest_published_date"
    }
}
