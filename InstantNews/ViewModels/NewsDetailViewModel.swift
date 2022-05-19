//
//  NewsDetailViewModel.swift
//  InstantNews
//
//  Created by Baya Walid on 09/05/2022.
//

import Foundation

class NewsDetailViewModel {
    
    init(_ article: Article) {
        self.article = article
    }
    
    var article: Article!
}
