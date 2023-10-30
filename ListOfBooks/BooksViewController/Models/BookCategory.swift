import Foundation

struct BookCategory: Decodable {
    let listName: String
    let oldestPublishedDate: String
    let dateFormatterPrint: Date?
    
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case oldestPublishedDate = "oldest_published_date"
        case dateFormatterPrint = "formattedDate"
    }
}




//MMM d, yyyy
