//
//  MaintenaceView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 11/04/2023.
//

import UIKit
import Firebase

class MaintenaceView: UIViewController {
    
    
    @IBOutlet weak var FNameTextField: UITextField!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var AddressTextField: UITextField!
    @IBOutlet weak var DetalsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func sendMaintenaceBtn(_ sender: Any) {
        guard let text1 = FNameTextField.text, !text1.isEmpty,
              let text2 = PhoneTextField.text, !text2.isEmpty,
              let text3 = EmailTextField.text, !text3.isEmpty,
              let text4 = AddressTextField.text, !text4.isEmpty,
              let text5 = DetalsTextView.text, !text5.isEmpty
        
        else {
            let alertController = UIAlertController(title: "Error", message: "Maintenace Request will not be sent to Renetic ", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let name = FNameTextField.text, let phone = PhoneTextField.text, let email = EmailTextField.text, let address = AddressTextField.text, let details = DetalsTextView.text else{
            return
        }
        let db = Firestore.firestore()
        let data = ["name": name, "email": email, "Phone": phone, "Address": address, "Details": details]
        db.collection("Maintenace_Request").addDocument(data: data){error in
            if let error = error {
                print(error.localizedDescription)
            } else{
                
            }
        }
    }
    

}
