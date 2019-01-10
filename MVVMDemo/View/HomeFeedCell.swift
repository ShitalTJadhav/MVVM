//
//  HomeFeedCell.swift
//  MVVMDemo
//
//  Created by Tushar  Jadhav on 2019-01-09.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import UIKit

class HomeFeedCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var iconImageView: UIImageView?

    var model: Video! {
        didSet {
            guard let model = model else {
                return
            }
            self.nameLabel?.text = model.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
