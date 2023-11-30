import UIKit

final class BooksTableViewCell: UITableViewCell {
    @IBOutlet private weak var bookPublishedDate: UILabel!
    @IBOutlet private weak var publishedDateInfo: UILabel!
    @IBOutlet private weak var bookGenreInfo: UILabel!
    @IBOutlet private weak var bookGenre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier: String {
        return String(describing: BooksTableViewCell.self)
    }
    
    static func register() -> UINib {
        UINib(nibName: String(describing: BooksTableViewCell.self), bundle: nil)
    }
    
    func setup(book: BookCategory) {
        bookGenre.text = "Book genres:".localized
        bookPublishedDate.text = "Published date:".localized
        bookGenreInfo.text = book.listName
        publishedDateInfo.text = book.displayOldestPublishedDate()
    }
}
