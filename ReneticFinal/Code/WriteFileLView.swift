//
//  WriteFileLView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 11/04/2023.
//

import UIKit
import CoreData


class WriteFileLView: UIViewController {

    
    
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func submitFileBtn(_ sender: Any) {
        let file = "\(UUID().uuidString).txt"
        let contents = textview.text!
        //Write Files into the Folder when button is Clicked
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
