//
//  FirstVC.swift
//  first_app
//
//  Created by BJIT on 11/09/1401 AP.
//

import UIKit

protocol ChangeBGColorDelegate {
    func changeImage(image: UIImage)
}

class FirstVC: UIViewController, ChangeBGColorDelegate {

    @IBOutlet weak var imageChange: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func changeImage(image: UIImage){
        imageChange.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecondVC"{
            if let destinationVC = segue.destination as? SecondVC{
                destinationVC.delegate = self
            }
        }
    }
    
    

    

}
