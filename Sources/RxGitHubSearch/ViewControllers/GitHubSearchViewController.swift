//
//  GitHubSearchViewController.swift
//  RxGitHubSearch
//
//  Created by Suyeol Jeon on 10/07/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class GitHubSearchViewController: UIViewController {
  fileprivate let githubService: GitHubService
  fileprivate var disposeBag = DisposeBag()

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
    self.searchBar.rx.text.changed
      .throttle(0.3, scheduler: MainScheduler.instance)
      .flatMapLatest { [weak self] query -> Observable<[String]> in
        guard let `self` = self else { return .just([]) }
        guard let query = query else { return .just([]) }
        return self.githubService.search(query: query)
      }
      .bind(to: self.tableView.rx.items(cellIdentifier: "cell")) { row, name, cell in
        cell.textLabel?.text = name
      }
      .disposed(by: self.disposeBag)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.tableView.frame = self.view.bounds
  }
}
