//
//  PayCheckView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 13/04/2023.
//

import UIKit
import Firebase

class PayCheckView: UIViewController {
    
    @IBOutlet weak var LNameTextField: UITextField!
    
    @IBOutlet weak var CVVNumberTextField: UITextField!
    @IBOutlet weak var xDate: UITextField!
    @IBOutlet weak var CNumberTextField: UITextField!
    @IBOutlet weak var FNameTextField: UITextField!
    @IBOutlet weak var amountDueLabel: UILabel!
    @IBOutlet weak var amountLeft: UILabel!
    @IBOutlet weak var amountPaidTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func calulatePayBtn(_ sender: Any) {
        guard let text1 = FNameTextField.text, !text1.isEmpty,
              let text2 = LNameTextField.text, !text2.isEmpty,
              let text3 = CNumberTextField.text, !text3.isEmpty,
              let text4 = xDate.text, !text4.isEmpty,
              let text5 = CVVNumberTextField.text, !text5.isEmpty,
              let text6 = amountPaidTextField.text, !text6.isEmpty
                
else {
            let alertController = UIAlertController(title: "Payment Declined", message: "Has all fields been entered?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        
        if let userInput = amountPaidTextField.text,
           let userInputAsNumber = Double(userInput),
           let numberAsNumber = Double(amountDueLabel.text ?? "0"){
            
            let result = numberAsNumber - userInputAsNumber
            
            
            //Show the user how much is left when calculated
            
            
            
            
            
            let alert = UIAlertController(title: "Payment Successful", message: "The difference is $\(result)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            amountLeft.text = "\(result)"
            
            guard let text = amountPaidTextField.text else {return}
            let ref = Database.database().reference()
            let textreF = ref.child("Paid")
            textreF.setValue(text)
            //This records the value of what was entered from the amount paid textfield and save it in our realtime database Firebase
            
        }
        
        
        
    }
}
