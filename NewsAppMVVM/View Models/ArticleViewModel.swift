//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by Harsh Verma on 05/05/23.
//

import Foundation

struct ArticleListViewModel {
    let article: [Article]
}

extension ArticleListViewModel {
    func rowsInSection(_ section: Int) -> Int {
        return self.article.count
    }
    
    func articleIndex(_ index: Int) -> ArticleViewModel {
        let art = self.article[index]
        return ArticleViewModel(art)
    }
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel: Codable {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title ?? "No Title"
    }
    
    var description: String {
        return self.article.description ?? "No Description"
    }
}
