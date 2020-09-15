//
//  WebService.swift
//  FabNews
//
//  Created by Veldanov, Anton on 9/14/20.
//

import Foundation


class WebService {
    func getArticles(url: URL, completion: @escaping ([Any]?)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error =  error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                print(data)
            }
        }.resume()
        
    }
}
