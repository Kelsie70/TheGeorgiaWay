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
    
    func showWebViewViewController() -> WebViewViewController {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
    }
    
    @IBAction func academicButtonAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/academics/"
        present(vc, animated: true, completion: nil)

    }
    
    @IBAction func careerDevButtonAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/career-development/"
        present(vc, animated: true, completion: nil)
    }
   
    @IBAction func leadershipOutreachButtonAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/leadership/"
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func alumniButtonAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/career-development/former-student-athletes/"
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func communityOutreachButtonAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/community-outreach/"
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func personalDevButtonAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/events/"
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func blogButtonAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/news/"
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func connectButtonAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/trending-wall/"
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

