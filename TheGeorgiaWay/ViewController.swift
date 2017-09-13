//
//  ViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 9/5/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bg1: UIImageView!
    
    @IBOutlet weak var bg2: UIImageView!
  
    @IBOutlet weak var bg3: UIImageView!
    
    @IBOutlet weak var bg4: UIImageView!
    
    @IBOutlet weak var bg5: UIImageView!
    
    @IBOutlet weak var bg6: UIImageView!
    
    @IBOutlet weak var bg7: UIImageView!
    
    @IBOutlet weak var bg8: UIImageView!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var academicButton: UIButton!
    
    @IBOutlet weak var alumniButton: UIButton!
    
    @IBOutlet weak var careerDevButton: UIButton!
    
    @IBOutlet weak var leadershipOutreachButton: UIButton!
    
    @IBOutlet weak var personalDevButton: UIButton!
    
    @IBOutlet weak var communityOutreachButton: UIButton!
    
    @IBOutlet weak var blogButton: UIButton!
    
    @IBOutlet weak var connectButton: UIButton!
    
    func showWebViewViewController() -> WebViewViewController {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
    }
    
    @IBAction func academicButtonAction(_ sender: Any) {
        bg1.alpha = 0.5
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/academics/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func careerDevButtonAction(_ sender: Any) {
        bg2.alpha = 0.5
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/career-development/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    @IBAction func leadershipOutreachButtonAction(_ sender: Any) {
        bg3.alpha = 0.5
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/leadership/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func alumniButtonAction(_ sender: Any) {
        bg4.alpha = 0.5
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/career-development/former-student-athletes/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func communityOutreachButtonAction(_ sender: Any) {
        bg5.alpha = 0.5
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/community-outreach/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func personalDevButtonAction(_ sender: Any) {
        bg6.alpha = 0.5
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/events/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func blogButtonAction(_ sender: Any) {
        bg7.alpha = 0.5
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/news/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func connectButtonAction(_ sender: Any) {
        bg8.alpha = 0.5
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/trending-wall/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        bg1.alpha = 1.0
        bg2.alpha = 1.0
        bg3.alpha = 1.0
        bg4.alpha = 1.0
        bg5.alpha = 1.0
        bg6.alpha = 1.0
        bg7.alpha = 1.0
        bg8.alpha = 1.0
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

