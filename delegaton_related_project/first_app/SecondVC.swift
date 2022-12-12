//
//  SecondVC.swift
//  first_app
//
//  Created by BJIT on 11/09/1401 AP.
//

import UIKit

class SecondVC: UIViewController {
    
    var delegate: ChangeBGColorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func greenTapped(_ sender: Any) {
        
        delegate?.changeImage(image: UIImage(named: "Aven")!)
        self.dismiss(animated: true)
    }
    
    
    @IBAction func redTapped(_ sender: Any) {
        
        delegate?.changeImage(image: UIImage(named: "Wolf")!)
        self.dismiss(animated: true)
    }
    
    
    

   
}
