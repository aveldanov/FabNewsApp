//
//  NewsListTableViewController.swift
//  FabNews
//
//  Created by Veldanov, Anton on 9/14/20.
//

import UIKit

class NewsListTableViewController: UITableViewController{
    
    
    private var articleListVM: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setStatusBar(backgroundColor: .darkGray)
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=9aff2ae2edb14019be1df1fe522dee01")!
        WebService().getArticles(url: url){ articles in
            print(articles)
            if let articles = articles{
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    
}





extension UINavigationController {
    
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
    
}
