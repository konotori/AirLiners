//
//  AirPlaneDetailTableViewController.swift
//  AirLiners
//
//  Created by Tung Nguyen on 11/29/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class AirPlaneDetailTableViewController: UITableViewController {
    

    var airPlane: Airplane?
    var leftLabels = ["National Origin", "Manufacturer", "First Flight", "Produced", "Number Built", "Status"]
    var rightLbels: [String] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let airPlane = self.airPlane {
            rightLbels = [airPlane.nationalOrigin, airPlane.manufacturer, airPlane.firstFlight, airPlane.proceduced, airPlane.numberBuilt, airPlane.status]
        }
        
        tableView.register(UINib.init(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId1")
        tableView.register(UINib.init(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId2")
        tableView.register(UINib.init(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId3")
        
        // Create back button
        let backButton = UIButton(frame: CGRect(x: 14, y: 44, width: 21, height: 21))
        backButton.setBackgroundImage(UIImage(named: "BackButton"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        self.view.addSubview(backButton)
        //tableView.contentInset = UIEdgeInsets(top: -44 , left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    // MARK: - Table view data source
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellId1") as? ImageTableViewCell
                cell?.img.image = UIImage(named: airPlane!.image)
                return cell!
            }
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellId2") as? DescriptionTableViewCell
                cell?.longDescription.attributedText = formatString(airPlane!.longDescription)
                return cell!
            }
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId3") as? DetailTableViewCell
            cell?.setupData(leftLabelContent: leftLabels[indexPath.row], rightLabelContent: rightLbels[indexPath.row])
            return cell!
        }
        return UITableViewCell()
    }
       
       override func numberOfSections(in tableView: UITableView) -> Int {
           return 2
       }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = tableView.dequeueReusableCell(withIdentifier: "SectionHeader")
            return headerView
        }
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return leftLabels.count
        }
        if section == 0 {
            return 2
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 36
    }
    
    // MARK: - Navigation
    
    // Action for back button
    @objc func backButtonTapped(sender: UIButton!) {
        performSegue(withIdentifier: "unWindToAirPlaneTableViewController", sender: Any?.self)
    }
    
    // MARK: - Other
    
    // Hightlight name of airplane
    func formatString(_ string: String) -> NSMutableAttributedString {
        let s = string as NSString
        let attributedString = NSMutableAttributedString(string: s as String)
        let r = s.range(of: "Boeing \\d+", options: .regularExpression, range: NSMakeRange(0,s.length))
        if r.length > 0 {
            attributedString.addAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .bold)], range: r)
        }
        return attributedString
    }
}



