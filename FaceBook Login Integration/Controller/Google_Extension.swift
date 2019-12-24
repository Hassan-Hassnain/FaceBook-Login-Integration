//
//  Google Extension.swift
//  FaceBook Login Integration
//
//  Created by Usama Sadiq on 12/24/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//

import Foundation
import GoogleSignIn


//MARK: - Google Functions

extension ViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        let fullName = user.profile.name
      
        if let fullName = fullName{
            User.name = fullName
        }
        
        print("Downloading image")
        
        
         let url = user.profile.imageURL(withDimension: 250)
            self.downloadImage(from: url!)
        imageView.image = User.picture
//        performSegue(withIdentifier: "ProfileView", sender: self)
        //isSeguePending = true
    }
   
    
    
    
}
