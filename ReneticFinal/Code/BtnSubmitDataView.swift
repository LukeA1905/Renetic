//
//  BtnSubmitDataView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 11/04/2023.
//

import UIKit

class BtnSubmitDataView: UIViewController {
    

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitBtn(_ sender: Any) {
        let file = "\(UUID().uuidString).txt"
        let contents = textView.text!
        
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = dir.appendingPathComponent(file)
        
        do{
            try contents.write(to: fileUrl, atomically: false, encoding: .utf8)
        }
        catch{
            print("Error:\(error)")
        }
        
    }
    
}
