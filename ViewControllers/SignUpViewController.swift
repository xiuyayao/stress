//
//  SignUpViewController.swift
//  Stress
//
//  Created by Xiuya Yao on 3/21/18.
//  Copyright © 2018 Xiuya Yao. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    let signUpAlertController = UIAlertController(title: "Invalid Input", message: "Please enter valid credentials", preferredStyle: .alert)
    
    @IBOutlet weak var emailLabel: UITextField!

    @IBOutlet weak var usernameLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBAction func registerUser(_ sender: UIButton) {
    
        // dismiss keyboard
        view.endEditing(true)
        
        if emailLabel.text!.isEmpty || usernameLabel.text!.isEmpty || passwordLabel.text!.isEmpty {
            self.present(self.signUpAlertController, animated: true)
        }
        
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.email = emailLabel.text
        newUser.username = usernameLabel.text
        newUser.password = passwordLabel.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            
            if let error = error {
                self.present(self.signUpAlertController, animated: true)
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // clear text labels
                self.emailLabel.text = ""
                self.usernameLabel.text = ""
                self.passwordLabel.text = ""
                // manually segue to logged in view
                // dismiss modal view
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelRegistration(_ sender: UIButton) {
        // dismiss keyboard
        view.endEditing(true)
        // dismiss modal view
        self.dismiss(animated: false, completion: nil)
    }
    
    // Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        // Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        
        // Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        // tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        signUpAlertController.addAction(OKAction)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

