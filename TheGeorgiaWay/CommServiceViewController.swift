//
//  CommServiceViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 10/8/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class CommServiceViewController: UIViewController {

    @IBOutlet weak var submit: UIBarButtonItem!
    
    @IBAction func submitAction(_ sender: Any) {
        let vc = showLeaderboardViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showLeaderboardViewController() -> LeaderboardViewController {
        let storyboard = UIStoryboard(name: "Leaderboard", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "LeaderboardViewController") as! LeaderboardViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
