//
//  TenantHomeViewViewController.swift
//  ReneticFinal
//
//  Created by Luke Austin on 13/04/2023.
//

import UIKit

class TenantHomeViewViewController: UIViewController {

    @IBOutlet weak var GreetingMsgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: date)
                
                if hour < 12 {
                    GreetingMsgLabel.text = "Good Morning"
                } else {
                    GreetingMsgLabel.text = "Good Evening"
                }
    }
    
    // Depening on the time of day, it should display a greeting message to the user
    
     
    

    @IBAction func signOutBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Renetic Sign Out", message: "Are you sure you want to sign out?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
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
        
        //This Code will take the user back to the Sign In page in the "Main" storyboard 
    }
    
}
