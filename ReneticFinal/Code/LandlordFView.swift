//
//  LandlordFView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 06/04/2023.
//

import UIKit

class LandlordFView: UIViewController {

    @IBOutlet weak var meetingMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    @IBAction func takeMeHomeBtn(_ sender: Any) {
        performSegue(withIdentifier: "goToLandlordStoryboard", sender: self)
    }
    
   
    @IBAction func SignOut(_ sender: Any) {
        let alertController = UIAlertController(title: "Renetic Sign Out", message: "Are you sure you want to sign out?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            //Sign Out button When user clicks, Give an UIAlert to User
            let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { _ in
                // Navigate to the new storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "signIn")
                UIApplication.shared.windows.first?.rootViewController = viewController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                // This Page goes to the first storyboard
            }
            alertController.addAction(signOutAction)
            
            present(alertController, animated: true, completion: nil)
    }
        
}
    

