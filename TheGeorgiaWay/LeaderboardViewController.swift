//
//  LeaderboardViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 10/11/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell : UITableViewCell {
    
    @IBOutlet weak var sportName: UILabel!
    
    @IBOutlet weak var points: UILabel!
    
}

class LeaderboardViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var sports = ["Track & Field", "Swim", "Football", "Baseball", "Equestrian", "Golf", "Basketball", "Soccer", "Tennis", "Volleyball"]
    
    var points = ["361", "256", "241", "197", "165", "154", "122", "97", "87", "58"]

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewCell: UITableViewCell!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0; //Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sport = sports[indexPath.row]
        let point = points[indexPath.row]
        
        // Instantiate a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardCell", for: indexPath) as! LeaderboardTableViewCell
        
        // Adding the right informations
        
        cell.sportName?.text = sport
        cell.points?.text = point
        
        // Returning the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell " + indexPath.row.description)
    }


    
}
