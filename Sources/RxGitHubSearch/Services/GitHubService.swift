//
//  GitHubService.swift
//  RxGitHubSearch
//
//  Created by Suyeol Jeon on 10/07/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import RxCocoa
import RxSwift

class GitHubService {
  /// Search GitHub repositories with a given query.
  ///
  /// - parameter query: A query to search.
  /// - returns: An observable sequence of an array of repositories' name.
  func search(query: String) -> Observable<[String]> {
    guard !query.isEmpty else { return .just([]) }
    let url = URL(string: "https://api.github.com/search/repositories?q=\(query)")!
    return URLSession.shared.rx.json(url: url)
      .map { data -> [String] in
        guard let json = data as? [String: Any] else { return [] }
        guard let items = json["items"] as? [[String: Any]] else { return [] }
        return items.flatMap { $0["full_name"] as? String }
      }
      .catchErrorJustReturn([])
  }
}
