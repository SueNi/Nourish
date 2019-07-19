//
//  inputController.swift
//  nourish
//
//  Created by GWC on 7/17/19.
//  Copyright © 2019 Safiyah Lakhany. All rights reserved.
//

import UIKit
import CoreData

class inputController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var textView: UITextView!
    
    //@IBOutlet weak var textView: UITextView!
    // textField.placeholder =
    //@IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        textView.delegate=self
        
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool
    {
        if(text == "\n")
        {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if(textView.text == "Start your review...")
        {
            textView.text = ""
        }
        textView.becomeFirstResponder()
    }

    func textViewDidEndEditing(_ textView: UITextView)
    {
//        if(textView.text == "")
//        {
//            textView.text = "Start your review..."
//        }
        textView.resignFirstResponder()
    }
   
    @IBAction func submitTask(_ sender: Any)
    {
        guard textView.text != "Start your review..."
            else{
                return
        }

        let delegate=UIApplication.shared.delegate as! AppDelegate
        let context=delegate.persistentContainer.viewContext

        var newTask=Task(context: context)
        newTask.name=textView.text

        delegate.saveContext()

        textView.text = "Start your review..."
        view.endEditing(true)
    }
    

    
}
