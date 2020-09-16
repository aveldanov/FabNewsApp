//
//  Article.swift
//  FabNews
//
//  Created by Veldanov, Anton on 9/14/20.
//

import Foundation

struct ArticleList: Decodable{
    var articles: [Article]
}

//struct Status: Decodable {
//    let status: String
//}


struct Article: Decodable {
    let title: String
    let description: String
}

//struct Article: Decodable {
//    let status: String
//}
