//
//  ViewController.swift
//  NewsAppMVVM
//
//  Created by Ahmet Hamamcioglu on 28.06.2022.
//

import UIKit
import SafariServices
import SDWebImage


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var articleList: ArticleListViewModel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var myImageView: UIImageView!
    var articles = [Article]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    }
    
    func setUP(){
        
                let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=de20eee328be4c04a1681ad117dc3733")!
        
        Webservice().getData(url: url){ articles in
            if let articles = articles {
                self.articleList = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {//data reloadlarken dispatchque
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //TableView Func
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleList == nil ? 0 : articleList.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleList.numberOfRowsInSections(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        let articleVM = articleList.articleAtIndex(index: indexPath.row)
        //newsData(title: articleVM.title, publishedAt: articleVM.publishedAt, subtitle: articleVM.description)
        if let imageUrl = articleVM.urlToImage, let url = URL(string: imageUrl) {
            cell.NewsImage.sd_setImage(with: url)
        }
        let dataModel = newsData(title: articleVM.title, publishedAt: articleVM.publishedAt, subtitle: articleVM.description)
        
        cell.reload(data: dataModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//deselect checkbox seçimini kaldırmak için
        tableView.deselectRow(at: indexPath, animated: true)
        let article = articleList.articleAtIndex(index: indexPath.row)
        
        guard let url = URL(string: article.url ?? "")else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
        
        
}
    




