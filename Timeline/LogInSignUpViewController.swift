//
//  LogInSignUpViewController.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

<<<<<<< Updated upstream:Timeline/LogInSignUpViewController.swift
class LogInSignUpViewController: UIViewController {
=======
class LoginSignupViewController: UIViewController {
    
    enum ViewMode {
        case Login
        case Signup
    }
    var mode: ViewMode = .Signup
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var URLField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    
    
    //CHECK TO SEE IF THE FIELDS ARE VALID FOR GETTING IN
    
    var fieldsAreValid: Bool {
        
        
        switch mode {
        case .Login:
            return !(emailField.text!.isEmpty || passwordField.text!.isEmpty)
        case .Signup:
            return !(usernameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty)
        }
    }
    
>>>>>>> Stashed changes:Timeline/LoginSignupViewController.swift

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViewBasedOnMode(mode)
        // Do any additional setup after loading the view.
    }
    
    func updateViewBasedOnMode(mode: ViewMode) {
        switch mode {
        case .Signup:
            actionButton.setTitle("Sign Up", forState: .Normal)
            
        case .Login:
            actionButton.setTitle("Log In", forState: .Normal)
            
            usernameField.removeFromSuperview()
            bioField.removeFromSuperview()
            URLField.removeFromSuperview()
            
        }
    }

    @IBAction func actionButtonTapped(sender: AnyObject) {
        if fieldsAreValid {
            switch mode {
                
            case.Signup:
                
                UserController.createUser(emailField.text!, username: usernameField.text!, password: passwordField.text!, bio: bioField.text, url: URLField.text, completion: { (success, user) -> Void in
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }else {
                        self.presentValidationAlertWithTitle("Unable to create User", text: "Please check your information")
                    }
                })
            case .Login:
                UserController.authenticateUser(emailField.text!, password: passwordField.text!, completion: { (success, user) -> Void in
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }else {
                        self.presentValidationAlertWithTitle("Unable to Login :(", text: "Maybe Try again? :)")
                    }
                })
            }
        }
        
    }
    
    func presentValidationAlertWithTitle(title: String, text: String) {
        
        let alert = UIAlertController(title: title, message: text, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
}























