//
//  WebService.swift
//  InstantNews
//
//  Created by Baya Walid on 16/05/2022.
//

import Foundation

public class WebService {
    
    func loadNews(completion: @escaping (NewsModel?) -> ()) {
        let apiKey = "e9d5a8d4548242d888b26727ea46597d"
        let sourceURL = URL(string :"https://newsapi.org/v2/everything?language=fr&apiKey=\(apiKey)&sources=le-monde,lequipe,google-news-fr,les-echos,liberation")!
        
        URLSession.shared.dataTask(with: sourceURL) { data, urlResponse, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let result = try! jsonDecoder.decode(NewsModel.self, from: data)
                completion(result)
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
