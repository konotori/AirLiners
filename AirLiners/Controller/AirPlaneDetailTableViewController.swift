//
//  AirPlaneDetailTableViewController.swift
//  AirLiners
//
//  Created by Tung Nguyen on 11/29/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class AirPlaneDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var airPlane: Airplane?
    var leftLabels = ["National Origin", "Manufacturer", "First Flight", "Produced", "Number Built", "Status"]
    var rightLbels: [String] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAirPlaneData()
        registerCells()
        setupBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Functions
    
    func hightLightName(_ string: String) -> NSMutableAttributedString {
        let atrributedString = string as NSString
        let mutabelAttributedString = NSMutableAttributedString(string: atrributedString as String)
        let range = atrributedString.range(of: "Boeing \\d+", options: .regularExpression, range: NSMakeRange(0,atrributedString.length))
        if range.length > 0 {
            mutabelAttributedString.addAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .bold)], range: range)
        }
        return mutabelAttributedString
    }
    
    func registerCells() {
        tableView.register(UINib.init(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId1")
        tableView.register(UINib.init(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId2")
        tableView.register(UINib.init(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId3")
    }
    
    func setupBackButton() {
        let backButton = UIButton(frame: CGRect(x: 14, y: 44, width: 21, height: 21))
        backButton.setBackgroundImage(UIImage(named: "BackButton"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        self.view.addSubview(backButton)
    }
    
    func setupAirPlaneData() {
        if let airPlane = self.airPlane {
            rightLbels = [airPlane.nationalOrigin, airPlane.manufacturer, airPlane.firstFlight, airPlane.proceduced, airPlane.numberBuilt, airPlane.status]
        }
    }

    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
           return 2
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let airPlane = airPlane else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId1") as? ImageTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.img.image = UIImage(named: airPlane.image)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId2") as? DescriptionTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.longDescription.attributedText = hightLightName(airPlane.longDescription)
                return cell
            }
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId3") as? DetailTableViewCell else {
                return UITableViewCell()
            }
            
            cell.cellConfig(leftLabelContent: leftLabels[indexPath.row], rightLabelContent: rightLbels[indexPath.row])
            return cell
        }
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 36
    }
    
    // MARK: - Navigation
    
    @objc func backButtonTapped(sender: UIButton!) {
        performSegue(withIdentifier: "unWindToAirPlaneTableViewController", sender: Any?.self)
    }
    
}



