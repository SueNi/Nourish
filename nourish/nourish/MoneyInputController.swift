//
//  MoneyInputController.swift
//  nourish
//
//  Created by Safiyah Lakhany on 7/18/19.
//  Copyright © 2019 Safiyah Lakhany. All rights reserved.
//

import UIKit

class MoneyInputController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var input: UITextField!
    var amount:Double! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.delegate = self
        // Do any additional setup after loading the view.
        input.addDoneButtonToKeyboard(myAction:  #selector(self.input.resignFirstResponder))
    }
    

    @IBAction func done(_ sender: Any)
    {
        if let cost = NumberFormatter().number(from: input.text!)?.doubleValue
        {
            self.amount = cost
        }
        else
        {
            print("Not a valid number")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let vc = segue.destination as! ThankYouController
        vc.show = self.amount
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
