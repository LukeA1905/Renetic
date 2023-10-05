//
//  SetCodeTView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 08/04/2023.
//

import UIKit
import Firebase


class SetCodeTView: UIViewController {

    @IBOutlet weak var CodeTextField: UITextField!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var labelInstruction: UILabel!
    @IBOutlet weak var lockImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func setCodeBtn(_ sender: Any) {
        guard let text1 = CodeTextField.text, !text1.isEmpty
        else {
            let alertController = UIAlertController(title: "Error", message: "No Code has been entered", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        guard let code = CodeTextField.text else{
            return
        }
        let db = Firestore.firestore()
        let data =  ["Code":code]
        db.collection("DCodes").addDocument(data: data){error in
            if let error = error{
                print(error.localizedDescription)
            } else{
                //Store Door Code into my Firebase Firestore Database
            }
        }
    }
    
}
