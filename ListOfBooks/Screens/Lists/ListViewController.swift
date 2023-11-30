import UIKit

final class ListViewController: UITableViewController {
    
    private var viewModel: ListViewModel
    private var list = [List]()
    
    init(viewModel: ListViewModel) {
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
        tableView.register(UINib(nibName: String(describing: ListCollectionViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ListCollectionViewCell.self))
        onRefresh()
    }
    
    @objc func onRefresh() {
        viewModel.onRefresh() { [ weak self ] result in
            self?.list = result
            self?.tableView.reloadData()
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
