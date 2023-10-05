//
//  RequestAccountView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 02/04/2023.
//

import UIKit
import Firebase


class RequestAccountView: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var choiceTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func requestAccount(_ sender: Any) {
        guard let text1 = nameTextField.text, !text1.isEmpty,
              let text2 = choiceTextField.text, !text2.isEmpty,
              let text3 = emailTextField.text, !text3.isEmpty
                // Add additional guard statements for any additional text fields
        else {
            let alertController = UIAlertController(title: "Error", message: "Please enter information in all text boxes", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        
        // If user does not enter any text into the textfield, it will display an UIerror message to the user
        
        
        
        guard let name = nameTextField.text, let email = emailTextField.text, let choice = choiceTextField.text else{
            return
        }
        
        let db = Firestore.firestore()
        let data = ["name": name, "email": email, "choice": choice]
        db.collection("account_request").addDocument(data: data){error in
            if let error = error {
                print(error.localizedDescription)
            } else{
            // This Code will save the users data into the Firebase Database, so that people at renetic can review their request and set them a account
            }
        }
        
    }
}
    


