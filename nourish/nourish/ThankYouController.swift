//
//  ThankYouController.swift
//  nourish
//
//  Created by Safiyah Lakhany on 7/18/19.
//  Copyright © 2019 Safiyah Lakhany. All rights reserved.
//

import UIKit

class ThankYouController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var show:Double = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(String(format:"$%.2f", show * 0.10)) has been donated"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
