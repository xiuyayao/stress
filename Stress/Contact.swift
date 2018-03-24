//
//  Contact.swift
//  Stress
//
//  Created by Xiuya Yao on 3/24/18.
//  Copyright © 2018 Xiuya Yao. All rights reserved.
//

import UIKit
import Parse

class Contact: NSObject {
    
    /**
     * Other methods
     */
    
    /**
     Method to add a user post to Parse (uploading image file)
     
     - parameter image: Image that the user wants upload to parse
     - parameter caption: Caption text input by the user
     - parameter completion: Block to be executed after save operation is complete
     */
    
    class func saveNewContact(image: UIImage?, withName name: String?, withEmail email: String?, withNumber number: String?, withCompletion completion: PFBooleanResultBlock?) {
        
        // Create Parse object PFObject
        let contact = PFObject(className: "Contact")
        
        // Add relevant fields to the object
        contact["user"] = PFUser.current() // Pointer column type that points to PFUser
        contact["picture"] = getPFFileFromImage(image: image) // PFFile column type
        contact["name"] = name
        contact["email"] = email
        contact["number"] = number
        
        // Save object (following function will save the object in Parse asynchronously)
        contact.saveInBackground { (success: Bool, error: Error?) in
            completion?(success, error)
        }
    }
    
    /**
     Method to convert UIImage to PFFile
     
     - parameter image: Image that the user wants to upload to parse
     
     - returns: PFFile for the the data in the image
     */
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
}
