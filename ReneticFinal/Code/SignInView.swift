//
//  SignInView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 03/04/2023.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInView: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        //SignIn Process of Firebase
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }
            
            if let error = error {
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                strongSelf.present(alertController, animated: true, completion: nil)
                return
            }
            // When the user sign in with their account
            
            if let email = authResult?.user.email {
                if email.contains("landlord123@renetic.com") {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondController = storyboard.instantiateViewController(withIdentifier: "LandlordHome")
                    self?.present(secondController, animated: true, completion: nil)
                    
                } else {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "tenantVC")
                    self?.present(viewController, animated: true, completion: nil)
                }
            }
        }
    }
}
