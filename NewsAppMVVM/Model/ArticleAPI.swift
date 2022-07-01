//
//  ArticleAPI.swift
//  NewsAppMVVM
//
//  Created by Ahmet Hamamcioglu on 28.06.2022.
//

import Foundation

struct ArticleList: Codable {//bunların hepsini API diye bir klasöre koy ve modelleri ayrı koy
    let articles: [Article]?
    
}

struct Article: Codable{
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let source: Source?
    var imageData: Data? = nil
    
}


struct Source: Codable {
    let name: String
}
