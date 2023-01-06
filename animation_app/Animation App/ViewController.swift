//
//  ViewController.swift
//  Animation App
//
//  Created by BJIT on 13/10/1401 AP.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var footballImageView: UIImageView!
    
   
    @IBOutlet weak var bottomConstarint: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bottomConstarint.constant += view.frame.height/4
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let options: UIView.AnimationOptions = [.autoreverse, .repeat]
        UIView.animate(withDuration: 2, delay: 0, options: options, animations: { [weak self] in
            self?.bottomConstarint.constant = 0
            self?.view.layoutIfNeeded()
        })
    }
}





