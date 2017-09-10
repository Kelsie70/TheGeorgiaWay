//
//  ViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 9/5/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var academicButton: UIButton!
    
    @IBOutlet weak var alumniButton: UIButton!
    
    @IBOutlet weak var careerDevButton: UIButton!
    
    @IBOutlet weak var leadershipOutreachButton: UIButton!
    
    @IBOutlet weak var personalDevButton: UIButton!
    
    @IBOutlet weak var communityOutreachButton: UIButton!
    
    @IBOutlet weak var blogButton: UIButton!
    
    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leadershipOutreachButton.titleLabel?.textAlignment = .center
        
        communityOutreachButton.titleLabel?.textAlignment = .center

        careerDevButton.titleLabel?.textAlignment = .center
    
        personalDevButton.titleLabel?.textAlignment = .center

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

