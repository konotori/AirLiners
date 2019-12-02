//
//  AirPlaneDetailViewController.swift
//  AirLiners
//
//  Created by Tung Nguyen on 11/28/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class AirPlaneDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var InformationView: [UIView]!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    @IBOutlet weak var nationalOriginLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var firstFlightLabel: UILabel!
    @IBOutlet weak var producedLabel: UILabel!
    @IBOutlet weak var numberBuiltLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var modelImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var rootView: UIView!
    
    // MARK: - Properties
    
    var airPlane : Airplane?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
        addBottomBorders(optionViews: InformationView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Functions
    
    func addBottomBorders(optionViews: [UIView]) {
        for uiView in optionViews {
            let thickness: CGFloat = 1.0
            let bottomBorder = CALayer()
            bottomBorder.frame = CGRect(x:0, y: uiView.frame.size.height - thickness, width: uiView.frame.size.width, height:thickness)
            bottomBorder.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0).cgColor
            uiView.layer.addSublayer(bottomBorder)
        }
    }
    
    func hightLightName(_ string: String) -> NSMutableAttributedString {
        let atrributedString = string as NSString
        let mutabelAttributedString = NSMutableAttributedString(string: atrributedString as String)
        let range = atrributedString.range(of: "Boeing \\d+", options: .regularExpression, range: NSMakeRange(0,atrributedString.length))
        
        if range.length > 0 {
            mutabelAttributedString.addAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .bold)], range: range)
        }
        
        return mutabelAttributedString
    }
    
    func updateView() {
        scrollView.contentInset = UIEdgeInsets(top: -44 , left: 0, bottom: 0, right: 0)
        
        guard let airPlane = airPlane else { return }
        
        modelImageView.image = UIImage(named: airPlane.image)
        longDescriptionLabel.attributedText = hightLightName(airPlane.longDescription)
        nationalOriginLabel.text = airPlane.nationalOrigin
        manufacturerLabel.text = airPlane.manufacturer
        firstFlightLabel.text = airPlane.firstFlight
        numberBuiltLabel.text = airPlane.numberBuilt
        statusLabel.text = airPlane.status
    }
}
