//
//  WebServices.swift
//  NewsAppMVVM
//
//  Created by Harsh Verma on 05/05/23.
//

import Foundation
class WebServices {
    
    func getArticles(url: URL, completion: @escaping([Article]?) -> ()) {
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, resp, mistake in
            if let fail = mistake {
                debugPrint(fail.localizedDescription)
                completion(nil)
            }
            if let info = data {
                let list = try! JSONDecoder().decode(ArticleList.self, from: info)
                print(list ?? "Whoops Empty data")
                completion(list.articles)
            }
        }
        task.resume()
    }
    
    
}
