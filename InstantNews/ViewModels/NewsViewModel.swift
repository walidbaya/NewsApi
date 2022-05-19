//
//  NewsViewModel.swift
//  InstantNews
//
//  Created by Baya Walid on 08/05/2022.
//

import Foundation
import SVProgressHUD

class NewsViewModel {
    private var webService: WebService!    
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func getData(completion: @escaping (NewsModel?) -> ()) {
        SVProgressHUD.show()
        self.webService.loadNews { (data) in
            completion(data)
            SVProgressHUD.dismiss()
        }
    }
}
