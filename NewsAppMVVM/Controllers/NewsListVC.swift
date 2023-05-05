//
//  ViewController.swift
//  NewsAppMVVM
//
//  Created by Harsh Verma on 05/05/23.
//  58c5607238d8441cb3855f33b5aac4f2

import UIKit

class NewsListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        let linkStr = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=58c5607238d8441cb3855f33b5aac4f2")!

        WebServices().getArticles(url: linkStr) { _ in
            
        }
    }
    
}

