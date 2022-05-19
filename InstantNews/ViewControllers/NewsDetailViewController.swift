//
//  NewsDetailViewController.swift
//  InstantNews
//
//  Created by Baya Walid on 09/05/2022.
//

import Foundation
import SDWebImage

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var urlButton: UIButton!
    
    var viewModel : NewsDetailViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        titleLabel.text = viewModel.article.title
        imageView.sd_setImage(with: URL(string: viewModel.article.urlToImage ?? ""), completed: nil)
        descTextView.text = viewModel.article.description
        urlButton.addTarget(self, action: #selector(openUrl), for: .touchUpInside)
    }
    
    @objc func openUrl() {
        if let url = URL(string: viewModel.article.url ?? "") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}
