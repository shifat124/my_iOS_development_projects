//
//  ViewController.swift
//  daily_task
//
//  Created by BJIT on 04/09/1401 AP.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func appendText(_ sender: Any) {
        guard let _ = textField.text,
                let _ = textLabel.text else{
            return
        }
        textLabel.text = textLabel.text! + textField.text!
    }
    
    
    @IBAction func clearText(_ sender: Any) {
        textLabel.text = ""
    }
    
    
   
}

