//
//  UrgentRequestTView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 16/04/2023.
//

import UIKit
import Firebase
import MessageUI

class UrgentRequestTView: UIViewController, MFMailComposeViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    var count = 0
    
    @IBAction func UrgentRequest(_ sender: Any) {
        count += 1
               let db = Firestore.firestore()
               let collection = db.collection("requests")
               collection.addDocument(data: ["message": "Request needed \(count)"]) { error in
                   if let error = error {
                       print("Error adding document: \(error)")
                   } else {
                       print("Document added")
                   }
               }// Adding Documents to Documents Database
           }
}
    
           
           
        
    
