//
//  Article.swift
//  NewsAppMVVM
//
//  Created by Harsh Verma on 05/05/23.
//

import Foundation


struct Article: Codable {
    let title: String
    let description: String
}


struct ArticleList: Codable {
    let articles: [Article]
}
