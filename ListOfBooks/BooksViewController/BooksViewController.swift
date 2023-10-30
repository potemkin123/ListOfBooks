import UIKit

final class BooksViewController: UITableViewController {
    private var viewModel: BooksViewModel
    private var books = [BookCategory]()
    let oldestPublishedDate = Date()
    
    
       init(viewModel: BooksViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = UIRefreshControl()
        tableView?.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.register(UINib(nibName: String(describing: BooksTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: BooksTableViewCell.self))
        onRefresh()
    }
    
    @objc func
    onRefresh() {
        viewModel.onRefresh() { [ weak self ] result in
            self?.books = result
            self?.tableView.reloadData()
        }
    }
    
    func dateFromApiString(_ oldestPublishedDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.date(from: oldestPublishedDate)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BooksTableViewCell.self), for: indexPath) as! BooksTableViewCell
        let book = books[indexPath.row]
        cell.setup(book: book)
        return cell
    }
}

extension Date {
    var toJustTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
    
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy")
        return dateFormatter.string(from: self)
    }
}
 
