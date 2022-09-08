//
//  NewsTableViewController.swift
//  NEWS
//
//  Created by mustafa yildiz on 8.09.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var articlesVM: ArticlesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=gb&apiKey=7d773cbc5e5640bba8156ed89520e6ac")!
        
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articlesVM = ArticlesViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return self.articlesVM == nil ? 0 : self.articlesVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.articlesVM.numberOfRowsInSection(section)
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {fatalError("Not found")}
            
        let articleVM = self.articlesVM.articleAtIndex(indexPath.row)
        
        // Create URL
        let url = URL(string: articleVM.urlToImage)!
       
        // Create Data Task
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    cell.newsImage.image = UIImage(data: data)
                }
            }
        }

        // Start Data Task
        dataTask.resume()
    
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description

        

        return cell
    }
   

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
