//
//  GitHubSearchViewController.swift
//  RxGitHubSearch
//
//  Created by Suyeol Jeon on 10/07/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit

class GitHubSearchViewController: UIViewController {
  fileprivate let githubService: GitHubService

  fileprivate let tableView = UITableView()
  fileprivate let searchBar = UISearchBar()

  init(githubService: GitHubService) {
    self.githubService = githubService
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

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
