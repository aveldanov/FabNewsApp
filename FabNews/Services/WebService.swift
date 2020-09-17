//
//  WebService.swift
//  FabNews
//
//  Created by Veldanov, Anton on 9/14/20.
//

import Foundation


class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
//            print(url)
            if let error =  error{
//                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
//                print("Data: ", data)
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList{
                    completion(articleList.articles)
                }
//                print(articleList?.articles)
            }
        }.resume()
        
    }
}


// , completion: @escaping ([Article]?)->()
