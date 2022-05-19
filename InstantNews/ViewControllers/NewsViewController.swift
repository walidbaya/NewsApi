//
//  NewsViewController.swift
//  InstantNews
//
//  Created by Baya Walid on 08/05/2022.
//

import UIKit
import SDWebImage
import FittedSheets

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = NewsViewModel(webService: WebService())
    var news:NewsModel?
    let colors:[UIColor] = [.pink, .indigo, .purple]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.setGradientBackground(colors: colors)
        navBarTitle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        tableView.rowHeight = 90
        viewModel.getData { data in
            self.news = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func navBarTitle(color: UIColor = .white) {
        guard let logoHeader = UIImage(named: "logo-white") else { return }
        
        let imageView = UIImageView(image: logoHeader)
        
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = color
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)
        
        self.navigationItem.titleView = titleView
    }
    
    func presentBottomSheet(_ vc : UIViewController) {
        let bottomSheet = SheetViewController(controller: vc, sizes: [ .percent(0.50), .fullscreen])
        present(bottomSheet, animated: true)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.titleLabel?.text = news?.articles?[indexPath.row].title
        cell.imgView.sd_setImage(with: URL(string: news?.articles?[indexPath.row].urlToImage ?? ""), completed: nil)
        cell.descLabel.text = news?.articles?[indexPath.row].source?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let art = news?.articles?[indexPath.row] {
            let mainStory = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainStory.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
            vc.viewModel = NewsDetailViewModel(art)
            self.presentBottomSheet(vc)
        }
    }
    
}
