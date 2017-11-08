//
//  CommServiceViewController.swift
//  TheGeorgiaWay
//
//  Created by Kelsie Belan on 10/8/17.
//  Copyright © 2017 Kelsie Belan. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class CommServiceViewController: UIViewController, MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var sport: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var eventName: UITextField!
    
    @IBOutlet weak var hours: UITextField!
    
    @IBOutlet weak var date: UITextField!
    
    @IBOutlet weak var uploadPictureText: UIButton!
    
    @IBAction func uploadPicture(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType =  UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    var selectedImageData : Data!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let image_data = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectedImageData = UIImagePNGRepresentation(image_data!)!
        let imageStr = selectedImageData.base64EncodedString()
        uploadedPicture.setTitle(imageStr, for: .normal)
        self.dismiss(animated: true, completion: nil)
        uploadPictureText.setTitle("Uploaded", for: .normal)
    }
    
    @IBOutlet weak var uploadedPicture: UIButton!
    
    @IBOutlet weak var submit: UIBarButtonItem!
    
    var formData : String!
    
    @IBAction func submitAction(_ sender: Any) {
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["kelsie70@gmail.com"])
        composeVC.setSubject("iOs App Test")
        composeVC.setMessageBody("Name: " + fullName.text! + "\n"
                                + "Sport: " + sport.text! + "\n"
                                + "Email: " + email.text! + "\n"
                                + "Event Name: " + eventName.text! + "\n"
                                + "Hours: " + hours.text! + "\n"
                                + "Date: " + date.text! + "\n", isHTML: false)
        let imageData: NSData = selectedImageData as NSData
        composeVC.addAttachmentData(imageData as Data, mimeType: "image/png", fileName: "imageName")
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)

        
        let vc = showLeaderboardViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    func setFormData() {
        
        let fullNameText = fullName.text != nil ? fullName.text : "not there"
        let sportText = sport.text != nil ? sport.text : "not there"
        let emailText = email.text != nil ? email.text : "not there"
        let eventNameText = eventName.text != nil ? eventName.text : "not there"
        let dateText = date.text != nil ? date.text : "not there"
        
        formData = "Name: " + fullNameText + "\n"
                + "Sport: " + sportText + "\n"
                + "Email: " + emailText + "\n"
                + "Event Name/Place: " + eventNameText + "\n"
                + "Date: " + dateText + "\n"
        
    }
    */
    
    func showLeaderboardViewController() -> LeaderboardViewController {
        let storyboard = UIStoryboard(name: "Leaderboard", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "LeaderboardViewController") as! LeaderboardViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }

}
