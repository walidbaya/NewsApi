//
//  NewsDataModel.swift
//  InstantNews
//
//  Created by Baya Walid on 08/05/2022.
//

import Foundation

struct NewsModel: Codable {
    var status: String? = ""
    var totalResults: Int? = 0
    var articles: [Article]? = []
}
    
struct Article: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}
