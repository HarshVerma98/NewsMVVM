//
//  ViewController.swift
//  NewsAppMVVM
//
//  Created by Harsh Verma on 05/05/23.
//  58c5607238d8441cb3855f33b5aac4f2

import UIKit

class NewsListVC: UIViewController {

    private var articleVM: ArticleListViewModel!
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        let linkStr = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=58c5607238d8441cb3855f33b5aac4f2")!

        WebServices().getArticles(url: linkStr) { articl in
           if let unbindArt = articl {
               self.articleVM = ArticleListViewModel(article: unbindArt)
               
               DispatchQueue.main.async {
                   self.table.reloadData()
               }
            }
          
        }
    }
    
}

extension NewsListVC: UITableViewDelegate, UITableViewDataSource {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleVM == nil ? 0 : self.articleVM.numberOfSections
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleVM.rowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.newsTitleLabel.text = articleVM.articleIndex(indexPath.row).title
        cell.newsDescriptionLabel.text = articleVM.articleIndex(indexPath.row).description
        return cell
    }
    
}
