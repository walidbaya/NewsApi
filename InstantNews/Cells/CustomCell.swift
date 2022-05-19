//
//  CustomCell.swift
//  InstantNews
//
//  Created by Baya Walid on 08/05/2022.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = ""
        self.descLabel.text = ""
    }
}
