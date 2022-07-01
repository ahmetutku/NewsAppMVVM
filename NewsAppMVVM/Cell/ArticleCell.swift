//
//  ArticleCell.swift
//  NewsAppMVVM
//
//  Created by Ahmet Hamamcioglu on 28.06.2022.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell{
    
    func reload(data: newsData, selected: Bool? = false){
        self.Title.text = data.title
        self.PublishedDate.text = data.publishedAt
        self.SubTitle.text = data.subtitle
        
    }
    
    @IBOutlet var Title: UILabel!
    @IBOutlet var PublishedDate: UILabel!
    @IBOutlet var SubTitle: UILabel!
    @IBOutlet var NewsImage: UIImageView!
    @IBOutlet var FavoriteButton: UIButton!
}
