//
//  ArticleViewModel.swift
//  FabNews
//
//  Created by Veldanov, Anton on 9/14/20.
//

import Foundation

struct ArticleListViewModel{
    let articles: [Article]
}

extension ArticleListViewModel{
    var numberOfSections: Int{
        return 1
    }
    func numberOfRowsInSection(_ section:Int)->Int{
        return self.articles.count
    }
}


struct ArticleViewModel{
    private let article: Article
    
}


extension ArticleViewModel{
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel{
    var title: String{
        return self.article.title
    }
    var description: String{
        return self.article.description
    }
}
