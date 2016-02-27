//
//  LogInSignUpChoiceViewController.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LogInSignUpChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destinationViewController = segue.destinationViewController as? LogInSignUpViewController{
            
            if segue.identifier == "loginIdentifier" {
                destinationViewController.mode = .Login
            }
            if segue.identifier == "signupIdentifier" {
                destinationViewController.mode = .Signup
            }
        }
    }
}
