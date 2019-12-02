//
//  AirplaneTableViewController.swift
//  AirLiners
//
//  Created by Tung Nguyen on 11/25/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class AirplaneTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var airplaines = [Airplane]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        airplaines = Airplane.loadDataAirPlane()
        customNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Functions
    
    func customNavigationBar() {
        let logo = UIImage(named: "NavTitle")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airplaines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AirplaneCell", for: indexPath) as? AirPlaneTableViewCell else {
            return UITableViewCell()
        }
        
        let airplane = airplaines[indexPath.row]
        cell.update(with: airplane)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "kAirPlaneDetailTableViewController") as? AirPlaneDetailTableViewController else { return }
        vc.airPlane = airplaines[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Navigation
    
    @IBAction func unwindToAirplaneTableView(unwindSegue: UIStoryboardSegue){
                
     }
}


