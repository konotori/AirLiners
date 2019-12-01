//
//  ImageTableViewCell.swift
//  AirLiners
//
//  Created by Tung Nguyen on 12/1/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
