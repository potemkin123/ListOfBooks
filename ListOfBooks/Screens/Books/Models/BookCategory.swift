import Foundation

struct BookCategory: Decodable {
    let listName: String
    let oldestPublishedDate: String
    
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case oldestPublishedDate = "oldest_published_date"
    }
    
    func displayOldestPublishedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date (from: oldestPublishedDate) else {
            return "N/A"
        }
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}
