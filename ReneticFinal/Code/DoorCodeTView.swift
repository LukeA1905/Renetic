//
//  DoorCodeTView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 18/04/2023.
//

import UIKit

class DoorCodeTView: UIViewController {

    @IBOutlet weak var DoorImage: UIImageView!
    @IBOutlet weak var doorCode: UILabel!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var CodeImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Label and Button within the storyboard 
    }
    
    
    @IBAction func clearCodeBtn(_ sender: Any) {
        doorCode.text = ""
    }
    
   

}
