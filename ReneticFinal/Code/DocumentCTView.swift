//
//  DocumentCTView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 11/04/2023.
//

import UIKit
import MobileCoreServices

class DocumentCTView: UIViewController, UIDocumentPickerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func importFileBtn(_ sender: Any) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.item"], in: .import)
           documentPicker.delegate = self
           present(documentPicker, animated: true, completion: nil)
    }
}

