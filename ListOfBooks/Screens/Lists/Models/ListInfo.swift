import Foundation

struct List: Decodable {
    let title: String
    let description: String
    let author: String
    let publisher: String
    let rankHistory: [Rank]
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case author
        case publisher
        case rankHistory = "rank_history"
    }
}

struct Rank: Decodable {
    let rank: Int
}
