//
//  ProfileViewController.swift
//  Stress
//
//  Created by Xiuya Yao on 3/22/18.
//  Copyright © 2018 Xiuya Yao. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBAction func logoutUser(_ sender: UIButton) {
        
        PFUser.logOutInBackground { (error: Error?) in
        }
        
        // PFUser.currentUser() will now be nil
        print("User logged out successfully")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        present(loginViewController, animated: true)  {
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
