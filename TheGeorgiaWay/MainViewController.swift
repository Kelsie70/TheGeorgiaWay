//
//  MainViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 10/5/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITabBarDelegate {
    
    
    @IBOutlet weak var academicsButton: UIButton!
    
    @IBOutlet weak var personalDevButton: UIButton!
    
    @IBOutlet weak var alumniButton: UIButton!
    
    @IBOutlet weak var careerDevButton: UIButton!
    
    @IBOutlet weak var commOutreachButton: UIButton!
    
    @IBOutlet weak var leadershipDevButton: UIButton!
    
    @IBOutlet weak var opportunityFormButton: UIButton!
    
    @IBOutlet weak var socialMediaButton: UIButton!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var tabOption1: UITabBarItem!
    
    @IBOutlet weak var tabOption2: UITabBarItem!
    
    @IBOutlet weak var tabOption3: UITabBarItem!
    
    @IBOutlet weak var tabOption4: UITabBarItem!
    
    @IBOutlet weak var tabOption5: UITabBarItem!
    
    var isButtonsShown = false
    
    
    @IBAction func socialMediaAction(_ sender: Any) {
        let vc = showSocialMediaViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func opportunityFormAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://student-svcs.sports.uga.edu/current-student-athletes/opportunity-fund-request/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func personalDevAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/events/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func leadershipDevAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/leadership/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func commOutreachAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/community-outreach/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func careerDevAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/career-development/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func alumniAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/career-development/former-student-athletes/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func academicsAction(_ sender: Any) {
        let vc = showWebViewViewController()
        vc.url = "http://thegeorgiaway.com/academics/"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showSocialMediaViewController() -> SocialMediaViewController {
        let storyboard = UIStoryboard(name: "SocialMedia", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "SocialMediaViewController") as! SocialMediaViewController
    }
    
    func showWebViewViewController() -> WebViewViewController {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
    }
    
    func showCommServiceViewController() -> CommServiceViewController {
        let storyboard = UIStoryboard(name: "CommService", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CommServiceViewController") as! CommServiceViewController
    }
    
    func showBlogViewController() -> BlogViewController {
        let storyboard = UIStoryboard(name: "Blog", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "BlogViewController") as! BlogViewController
    }

    
    func showMoreButtons() {
        academicsButton.isHidden = false;
        personalDevButton.isHidden = false;
        alumniButton.isHidden = false;
        careerDevButton.isHidden = false;
        commOutreachButton.isHidden = false;
        leadershipDevButton.isHidden = false;
        opportunityFormButton.isHidden = false;
        socialMediaButton.isHidden = false;
    
    }

    func hideMoreButtons() {
        academicsButton.isHidden = true;
        personalDevButton.isHidden = true;
        alumniButton.isHidden = true;
        careerDevButton.isHidden = true;
        commOutreachButton.isHidden = true;
        leadershipDevButton.isHidden = true;
        opportunityFormButton.isHidden = true;
        socialMediaButton.isHidden = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.delegate = self
        
        hideMoreButtons()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hideMoreButtons()
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            let vc = showBlogViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if item.tag == 2 {
            let vc = showWebViewViewController()
            vc.url = "http://calendar.uga.edu/calendar"
            self.navigationController?.pushViewController(vc, animated: true)
        } else if item.tag == 3 {
            if isButtonsShown == false {
                showMoreButtons()
                isButtonsShown = true
            } else {
                hideMoreButtons()
                isButtonsShown = false
            }
        } else if item.tag == 4 {
            let vc = showCommServiceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if item.tag == 5 {
            let vc = showWebViewViewController()
            vc.url = "https://network.thegeorgiaway.com/"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }


}
