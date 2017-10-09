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
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var tabOption1: UITabBarItem!
    
    @IBOutlet weak var tabOption2: UITabBarItem!
    
    @IBOutlet weak var tabOption3: UITabBarItem!
    
    @IBOutlet weak var tabOption4: UITabBarItem!
    
    @IBOutlet weak var tabOption5: UITabBarItem!

    @IBOutlet weak var tableView: UITableView!
    
    func showWebViewViewController() -> WebViewViewController {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
    }
    
    func showCommServiceViewController() -> CommServiceViewController {
        let storyboard = UIStoryboard(name: "CommService", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CommServiceViewController") as! CommServiceViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tabBar.delegate = self
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            let vc = showWebViewViewController()
            vc.url = "http://student-svcs.sports.uga.edu/current-student-athletes/opportunity-fund-request/"
            self.navigationController?.pushViewController(vc, animated: true)
        } else if item.tag == 2 {
            print("Tag two")
        } else if item.tag == 3 {
            print("Tag three")
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
