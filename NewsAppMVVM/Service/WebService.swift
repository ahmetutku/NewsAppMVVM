//
//  WebService.swift
//  NewsAppMVVM
//
//  Created by Ahmet Hamamcioglu on 28.06.2022.
//

import Foundation
import UIKit

class Webservice{
    
    func getData(url: URL, completion: @escaping ([Article]?)-> ()){//escaping zaman alan bişey varsa direk çıksın
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {//errorlerden biri bizim tanımladığımız
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let listdata = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let list = listdata{
                    completion(list.articles)
                }
            }
        }.resume()
    }
    
}


