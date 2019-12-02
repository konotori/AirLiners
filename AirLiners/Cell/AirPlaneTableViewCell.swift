//
//  AirPlaneTableViewCell.swift
//  AirLiners
//
//  Created by Tung Nguyen on 11/25/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class AirPlaneTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var shorInfo: UILabel!
    @IBOutlet weak var modelImage: UIImageView!
    @IBOutlet weak var viewCell: UIView!
    
    // MARK: - Functions
    
    func update(with airplane: Airplane) {
        modelNameLabel.text = "The Boing \(airplane.model)"
        shorInfo.text = airplane.shortInfo
        modelImage.image = UIImage(named: airplane.image)
        modelImage.layer.cornerRadius = 8
        viewCell.layer.cornerRadius = 7
    }
}
