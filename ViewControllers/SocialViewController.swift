//
//  SocialViewController.swift
//  Stress
//
//  Created by Xiuya Yao on 3/22/18.
//  Copyright © 2018 Xiuya Yao. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {

    @IBAction func AddContact(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "AddContactSegue", sender: nil)
    }
    
    @IBOutlet weak var roseProfilePic: UIImageView!
    
    @IBOutlet weak var ashtonProfilePic: UIImageView!
    
    @IBOutlet weak var victoriaProfilePic: UIImageView!
    
    @IBOutlet weak var joshProfilePic: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        roseProfilePic.layer.cornerRadius = 70;
        ashtonProfilePic.layer.cornerRadius = 70;
        victoriaProfilePic.layer.cornerRadius = 70;
        joshProfilePic.layer.cornerRadius = 70;
        
        roseProfilePic.layer.masksToBounds = true;
        ashtonProfilePic.layer.masksToBounds = true;
        victoriaProfilePic.layer.masksToBounds = true;
        joshProfilePic.layer.masksToBounds = true;

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
