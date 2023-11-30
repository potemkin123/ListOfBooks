import UIKit

final class BooksTableViewCell: UITableViewCell {
    @IBOutlet private weak var bookPublishedDate: UILabel!
    @IBOutlet private weak var publishedDateInfo: UILabel!
    @IBOutlet private weak var bookNameInfo: UILabel!
    @IBOutlet private weak var bookName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier: String {
        return String(describing: BooksTableViewCell.self)
    }
    
    static func register() -> UINib {
        UINib(nibName: String(describing: BooksTableViewCell.self), bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(book: BookCategory) {
        bookName.text = "Book genres:".localized
        bookPublishedDate.text = "Published date:".localized
        bookNameInfo.text = book.listName
        publishedDateInfo.text = book.displayOldestPublishedDate()
    }
}
