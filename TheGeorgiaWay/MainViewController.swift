//
//  MainViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 10/5/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell{
    
    @IBOutlet weak var blogImage: UIImageView!
  
    @IBOutlet weak var blogTitle: UILabel!
    
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    var images = ["football1.jpg", "gymnastics.jpg", "ugadog.jpg", "swim.jpg"]
    
    var titles = ["Dawgs Beat Tennessee 41-0", "Gym Dawgs Take 1st Again", "Uga Enjoying a Saturday in Athens", "Swim Records at Last Meet"]
    
    @IBOutlet weak var academicsButton: UIButton!
    
    @IBOutlet weak var personalDevButton: UIButton!
    
    @IBOutlet weak var alumniButton: UIButton!
    
    @IBOutlet weak var careerDevButton: UIButton!
    
    @IBOutlet weak var commOutreachButton: UIButton!
    
    @IBOutlet weak var leadershipDevButton: UIButton!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var tabOption1: UITabBarItem!
    
    @IBOutlet weak var tabOption2: UITabBarItem!
    
    @IBOutlet weak var tabOption3: UITabBarItem!
    
    @IBOutlet weak var tabOption4: UITabBarItem!
    
    @IBOutlet weak var tabOption5: UITabBarItem!

    @IBOutlet weak var tableView: UITableView!
    
    var isButtonsShown = false
    
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
    
    
    
    func showWebViewViewController() -> WebViewViewController {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
    }
    
    func showCommServiceViewController() -> CommServiceViewController {
        let storyboard = UIStoryboard(name: "CommService", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CommServiceViewController") as! CommServiceViewController
    }
    
    func showMoreButtons() {
        academicsButton.isHidden = false;
        personalDevButton.isHidden = false;
        alumniButton.isHidden = false;
        careerDevButton.isHidden = false;
        commOutreachButton.isHidden = false;
        leadershipDevButton.isHidden = false;
    
    }

    func hideMoreButtons() {
        academicsButton.isHidden = true;
        personalDevButton.isHidden = true;
        alumniButton.isHidden = true;
        careerDevButton.isHidden = true;
        commOutreachButton.isHidden = true;
        leadershipDevButton.isHidden = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tabBar.delegate = self
        
        hideMoreButtons()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hideMoreButtons()
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            let vc = showWebViewViewController()
            vc.url = "http://student-svcs.sports.uga.edu/current-student-athletes/opportunity-fund-request/"
            self.navigationController?.pushViewController(vc, animated: true)
        } else if item.tag == 2 {
            let vc = showWebViewViewController()
            vc.url = "http://calendar.uga.edu/home/category/service-volunteer-opportunities/"
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0; //Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let image = images[indexPath.row]
        let title = titles[indexPath.row]
        
        // Instantiate a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "blogCell", for: indexPath) as! BlogTableViewCell
        
        // Adding the right informations
        
        if let uiimage = UIImage(named: image) {
            cell.blogImage.image = uiimage
        }
        
        cell.blogTitle?.text = title
        
        // Returning the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell " + indexPath.row.description)
    }
    

}
