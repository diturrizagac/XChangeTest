//
//  FiatExchangeView.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 3/03/22.
//

import UIKit

class FiatExchangeView: UIViewController, FiatExchangeViewable {
    
    var presenter: FiatExchangePresenterProtocol = FiatExchangePresenter()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.alwaysBounceVertical = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GenericTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.backgroundColor = UIColor.clear
        tableView.dropShadow()
        tableView.addSubview(refreshControl)
        return tableView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        let attributes = [ NSAttributedString.Key.foregroundColor: UIColor.gray ]
        refreshControl.attributedTitle = NSAttributedString(string: "Loading", attributes: attributes)
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        refreshControl.tintColor = .systemBlue
        return refreshControl
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        searchbar.placeholder = "Buscar"
        searchbar.backgroundImage = UIImage()
        searchbar.delegate = self
        return searchbar
    }()
    
    private var staticConstraints: [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: [
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        constraints.append(contentsOf: [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        return constraints
    }
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        presenter.viewDidLoad()
    }
}

extension FiatExchangeView: FiatExchangeViewConfigurable {
    func configureTitle(title: String) {
        self.title = title
    }
    
    func setViewInteraction(_ enabled: Bool) {
        view.isUserInteractionEnabled = enabled
    }
    
}

extension FiatExchangeView: FiatExchangeViewReloadable {
    func reloadData() {
        tableView.reloadData()
    }
}


extension FiatExchangeView: UITableViewDelegate {
    
}

extension FiatExchangeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GenericTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.configureCell(cellStyle: .clickable,
                           model: presenter.cellModelArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension FiatExchangeView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.updateRates(using: searchText)
    }
}

extension FiatExchangeView {
    private func setupUI() {
        NSLayoutConstraint.activate(staticConstraints)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    @objc private func refreshTable() {
        presenter.refreshData()
        refreshControl.endRefreshing()
    }
}

extension FiatExchangeView: ErrorHandler {}
