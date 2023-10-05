//
//  FinanceLView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 13/04/2023.
//

import UIKit
import Firebase

class FinanceLView: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatx = DateFormatter()
        dateFormatx.dateFormat = "dd-MM-yyyy"
        
        let currentDate = Date()
        let dateString = dateFormatx.string(from: currentDate)
        
        dateLabel.text = dateString
        
        let ref = Database.database().reference()
        let textRef = ref.child("Paid")
        textRef.observe(.value) { snapshot in
            if let text = snapshot.value as? String {
                self.price.text = text 
            }
            //Get reference from Database and display it in the label 
        }

       
    }
    


}
