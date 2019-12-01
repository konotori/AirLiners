//
//  DetailTableViewCell.swift
//  AirLiners
//
//  Created by Tung Nguyen on 11/29/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var uiView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Add bottom border
        let thickness: CGFloat = 1.0
        let bottomBorder = CALayer()
            bottomBorder.frame = CGRect(x:0, y: uiView.frame.size.height - thickness, width: 378, height:thickness)
               bottomBorder.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0).cgColor
               uiView.layer.addSublayer(bottomBorder)
    }
    

    func setupData(leftLabelContent: String, rightLabelContent: String) {
        leftLabel.text = leftLabelContent
        rightLabel.text = rightLabelContent
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
