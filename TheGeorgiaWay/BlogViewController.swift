//
//  BlogViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 11/12/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell{
    
    @IBOutlet weak var blogTitle: UILabel!
    
    @IBOutlet weak var blogWebView: UIWebView!
    
}

class BlogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var images = ["football1.jpg", "gymnastics.jpg", "ugadog.jpg", "swim.jpg"]
    
    var titles = ["Dawgs Beat Tennessee 41-0", "Gym Dawgs Take 1st Again", "Uga Enjoying a Saturday in Athens", "Swim Records at Last Meet"]
    
     var dataValues: NSArray = []
    
    var dataValuesPost: NSArray = []
    
    var dataValuesMedia: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0; //Choose your custom row height
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let dataUrl = NSURL(string: "http://thegeorgiaway.com/wp-json/wp/v2/media/")
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        let whichItem = dataValues[(indexPath as NSIndexPath).row]
        
        let passedDictionary = (whichItem as AnyObject)["media_details"] as? [String:Any]
        let sizes = passedDictionary?["sizes"] as?  [String:Any]
        let medium = sizes?["medium"] as?  [String:Any]
        let innerItem = medium?["source_url"] as? String
        
        print(innerItem ?? "not there")
        
        let dataUrlPost = NSURL(string: "http://thegeorgiaway.com/wp-json/wp/v2/posts")
        let theDataPost = NSData(contentsOf: dataUrlPost! as URL)
        dataValuesPost = try! JSONSerialization.jsonObject(with: theDataPost! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        let whichItemPost = dataValuesPost[(indexPath as NSIndexPath).row]
        
        let passedDictionaryPost = (whichItemPost as AnyObject)["title"] as? [String:Any]
        let titleRendered = passedDictionaryPost?["rendered"] as? String
        print(titleRendered ?? "not there posts")
        
        let passedDictionaryLink = (whichItemPost as AnyObject)["_links"] as? [String:Any]
        let featuredMedia = passedDictionaryLink?["wp:featuredmedia"] as? [String:Any]
        let featuredMediaLink = featuredMedia?["href"] as? String
        print(featuredMediaLink ?? "not there links")
        
        /*
        let dataUrlMedia = NSURL(string: featuredMediaLink ?? "http://thegeorgiaway.com/wp-json/wp/v2/media/10224")
        let theDataMedia = NSData(contentsOf: dataUrlMedia! as URL)
        dataValuesMedia = try! JSONSerialization.jsonObject(with: theDataMedia! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        let whichItemMedia = dataValuesMedia[(indexPath as NSIndexPath).row]
        
        let passedDictionaryMedia = (whichItemMedia as AnyObject)["media_details"] as? [String:Any]
        let sizesMedia = passedDictionaryMedia?["sizes"] as?  [String:Any]
        let mediumMedia = sizesMedia?["medium"] as?  [String:Any]
        let innerItemMedia = mediumMedia?["source_url"] as? String
        */
        let url = NSURL(string: innerItem ?? "http://thegeorgiaway.com/wp-content/uploads/2015/09/LPE-East-Athens-2017.png")
        let req = NSURLRequest(url:url! as URL)
        
        // Instantiate a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "blogCell", for: indexPath) as! BlogTableViewCell
        
        cell.blogTitle?.text = titleRendered
        cell.blogWebView?.loadRequest(req as URLRequest)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell " + indexPath.row.description)
    }

}
