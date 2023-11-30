import UIKit

final class BooksViewController: UITableViewController {
    private var viewModel: BooksViewModel
    private var books = [BookCategory]()
    
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
    
    @objc func onRefresh() {
        viewModel.onRefresh() { [ weak self ] result in
            self?.books = result
            self?.tableView.reloadData()
        }
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
