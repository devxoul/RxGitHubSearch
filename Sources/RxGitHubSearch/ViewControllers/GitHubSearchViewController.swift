//
//  GitHubSearchViewController.swift
//  RxGitHubSearch
//
//  Created by Suyeol Jeon on 10/07/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit

class GitHubSearchViewController: UIViewController {
  fileprivate let tableView = UITableView()
  fileprivate let searchBar = UISearchBar()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white

    self.navigationController?.navigationBar.barStyle = .blackOpaque
    self.navigationItem.titleView = self.searchBar
    self.searchBar.placeholder = "Search"

    self.tableView.keyboardDismissMode = .onDrag
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    self.view.addSubview(self.tableView)

    self.bind()
  }

  func bind() {

  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.tableView.frame = self.view.bounds
  }
}
