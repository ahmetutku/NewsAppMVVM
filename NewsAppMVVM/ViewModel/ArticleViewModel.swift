//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by Ahmet Hamamcioglu on 28.06.2022.
//

import Foundation

struct ArticleListViewModel{
    let articles: [Article]
}

extension ArticleListViewModel{
    var numberOfSections: Int{
        return articles.count
    }
    
    func numberOfRowsInSections(_ section: Int) -> Int{
        return articles.count
    }
    func articleAtIndex( index: Int) -> ArticleViewModel{
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
 

struct ArticleViewModel{
    let article: Article
}

extension ArticleViewModel{
    init(_ article: Article){
        self.article = article
    }
    
    var title: String{
        return self.article.title ?? ""
    }
    var description: String{
        return self.article.description ?? ""
    }
    var url: String?{
        return self.article.url
    }
    var urlToImage: String?{
        return self.article.urlToImage
    }
    var publishedAt: String{
        return self.article.publishedAt ?? ""
    }
    var source: Source{
        return self.article.source ?? .init(name: "google.com")
    }
    
}
