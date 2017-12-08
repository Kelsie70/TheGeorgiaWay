//
//  WebBlogViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 12/6/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class WebBlogViewController: UIViewController {

    @IBOutlet weak var blogWeb: UIWebView!
    
    public var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blogWeb.loadRequest(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
