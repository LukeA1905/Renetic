//
//  TenantFView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 07/04/2023.
//

import UIKit

class TenantFView: UIViewController {

    @IBOutlet weak var landlordLbl: UILabel!
    @IBOutlet weak var paymentLbl: UILabel!
    @IBOutlet weak var keyLbl: UILabel!
    @IBOutlet weak var docLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func takeMeHomeF(_ sender: Any) {
        performSegue(withIdentifier: "goToTenantStoryboard", sender: self)
    }
    

}
