//
//  Webservice.swift
//  NEWS
//
//  Created by mustafa yildiz on 8.09.2022.
//

import Foundation


class Webservice {
    
    func getArticles(url: URL, completion: @escaping([Article]?)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let articleList = try? JSONDecoder().decode(Articles.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles[0].title)
            }
        }.resume()
    }
    
    
}






