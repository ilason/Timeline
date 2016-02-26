//
//  LogInSignUpViewController.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LogInSignUpViewController: UIViewController {
    
    // All of the outlests for the LogInSignUpViewController
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextFileld: UITextField!
    @IBOutlet weak var passwordTextFileld: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var websiteURLTextField: UITextField!
    
    //Check to see if the fiels are valid via the button
    
    // MARK  I dont really understand the syntax that well here.
    @IBAction func actionButtonTapped(sender: AnyObject) {
        if fieldsAreValid{
            switch mode{
            case .Login:
                UserController.authenticateUser(emailTextFileld.text!, password: passwordTextFileld.text!, completion: { (success, user) -> Void in
                    if success, let _ = user {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else{
                        self.presentValidationAlertWithTitle("Unable to Login", message: "Consider checking your information")
                    }
                })
            case .Signup:
                UserController.createUser(emailTextFileld.text!, userName: userNameTextField.text!, password: passwordTextFileld.text!, bio: bioTextField.text, url: websiteURLTextField.text, completion: { (success, user) -> Void in
                    if success, let _ = user {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Unable to Signup ", message: "Be sure to check all the fields")
                    }
                })
            }
        }
    }
    
    //create a present validation alert with title func and impliment it
    func presentValidationAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    //ActionButton Outlet
    @IBOutlet weak var actionButton: UIButton!
    
    //Enum to switch the views between login and signup
    enum ViewMode {
        case Login
        case Signup
    }
    // calculated property that validates that there is text in the required text fields based on the modes
    var fieldsAreValid: Bool {
        get{
            switch mode {
            case .Login:
                return !(emailTextFileld.text!.isEmpty || passwordTextFileld.text!.isEmpty)
            case.Signup:
                return !(userNameTextField.text!.isEmpty || emailTextFileld.text!.isEmpty || passwordTextFileld.text!.isEmpty)
            }
        }
    }
    
    
    var mode = ViewMode.Signup
    
    // Update the views based on the mode
    func updateViewBasedOnMode() {
        switch mode {
        case .Login:
            userNameTextField.hidden = true
            bioTextField.hidden = true
            websiteURLTextField.hidden = true
            
            actionButton.setTitle("Login", forState: .Normal)
        case.Signup:
            actionButton.setTitle("Signup", forState: .Normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewBasedOnMode()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
