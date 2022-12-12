//
//  ViewController.swift
//  daily_task
//
//  Created by BJIT on 04/09/1401 AP.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redButton(_ sender: Any) {
        myLabel.text = "Red"
        myLabel.textColor = UIColor.red
    }
    
    @IBAction func blueButton(_ sender: Any) {
        myLabel.text = "Blue"
        myLabel.textColor = UIColor.blue
    }
    
    
    @IBAction func yellowButton(_ sender: Any) {
        myLabel.text = "Yellow"
        myLabel.textColor = UIColor.yellow
    }
    
   
}

