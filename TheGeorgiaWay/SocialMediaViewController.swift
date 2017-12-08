//
//  SocialMediaViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 11/12/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit

class SocialMediaViewController: UIViewController {

    @IBAction func facebookAction(_ sender: Any) {
        passURLToWebViewController(setUrl: "https://www.facebook.com/UGAAthleticsStudentServices/")
    }
    
    @IBAction func instagramAction(_ sender: Any) {
        passURLToWebViewController(setUrl: "https://www.instagram.com/thegeorgiaway/")
    }
    
    @IBAction func linkedInAction(_ sender: Any) {
        passURLToWebViewController(setUrl: "https://www.linkedin.com/groups/8357275/profile")
    }
    
    @IBAction func twitterAction(_ sender: Any) {
        passURLToWebViewController(setUrl: "https://twitter.com/TheGeorgiaWay")
    }
    
    @IBAction func youtubeAction(_ sender: Any) {
        passURLToWebViewController(setUrl: "https://www.youtube.com/channel/UCVBKWH4mGg-mgMOwiYoTtjQ")
    }
    
    func passURLToWebViewController(setUrl: String) {
        let vc = showWebViewViewController()
        vc.url = setUrl
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showWebViewViewController() -> WebViewViewController {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

   

}
