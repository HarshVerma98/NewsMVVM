//
//  WebServices.swift
//  NewsAppMVVM
//
//  Created by Harsh Verma on 05/05/23.
//

import Foundation
class WebServices {
    
    func getArticles(url: URL, completion: @escaping([Any]?) -> ()) {
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, resp, mistake in
            if let fail = mistake {
                debugPrint(fail.localizedDescription)
                completion(nil)
            }
            if let info = data {
                print(data)
                
            }
        }
        task.resume()
    }
    
    
}
