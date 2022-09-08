//
//  ArticlesViewModel.swift
//  NEWS
//
//  Created by mustafa yildiz on 8.09.2022.
//

import Foundation


struct ArticlesViewModel{
    
    let articles: [Article]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int)->Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int)-> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
    
}



struct ArticleViewModel{
    
    private let article: Article
    
    init(_ article: Article){
        self.article = article
    }
    
    var title: String {
        return self.article.title ?? "Not found"
    }
    
    var description: String {
        return self.article.description ?? "Not found"
    }
    
    var urlToImage: String {
        return self.article.urlToImage ?? "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
    }
}
