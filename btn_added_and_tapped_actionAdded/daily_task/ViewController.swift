//
//  ViewController.swift
//  daily_task
//
//  Created by BJIT on 04/09/1401 AP.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func largeBtnClicked(_ sender: Any) {
        print("Large Button was tapped!!")
    }
    
    @IBAction func smallBtnClicked(_ sender: Any) {
        print("Small Button was tapped!!")
    }
    
    
    @IBAction func mediumBtnClicked(_ sender: Any) {
        print("Medium Button was tapped!!")
    }
}

