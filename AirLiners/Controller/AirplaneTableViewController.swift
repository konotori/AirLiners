//
//  AirplaneTableViewController.swift
//  AirLiners
//
//  Created by Tung Nguyen on 11/25/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class AirplaneTableViewController: UITableViewController {
    
    var airplaines = [Airplane]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        airplaines = Airplane.loadDataAirPlane()
        
        // Customize title of navigation bar
        let logo = UIImage(named: "NavTitle")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airplaines.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirplaneCell", for: indexPath) as! AirPlaneTableViewCell
        let airplane = airplaines[indexPath.row]
        cell.update(with: airplane)
        return cell
    }

    
    @IBAction func unwindToAirplaneTableView(unwindSegue: UIStoryboardSegue){
                
     }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "AirPlaneDetailViewController") as? AirPlaneDetailViewController
        vc?.airPlane = airplaines[indexPath.row]
        vc?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

}


