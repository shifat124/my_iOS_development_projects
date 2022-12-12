//
//  ViewController.swift
//  table_view
//
//  Created by BJIT on 14/09/1401 AP.
//

import UIKit

var rowIndicator = 0
var sectionIndicator = 0

class MyViewController: UIViewController{
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "NibTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "nibCell")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "connector"{
            if let destinationSecondVC = segue.destination as? SecondViewController{
                let index = tableView.indexPathForSelectedRow
                destinationSecondVC.loadViewIfNeeded()
                destinationSecondVC.secImgView.image = UIImage(named: Pet.pets[index!.row].imgId)
                destinationSecondVC.secTitleTxt.text = Pet.pets[index!.row].name
                destinationSecondVC.secDescTxt.text = Pet.pets[index!.row].imgDesc
            }
        }
    }


}

extension MyViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Pet Animals"
        }
        return "NIB Section"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Pet.pets.count
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
                    let petName = Pet.pets[indexPath.row].name
                    let imgId = Pet.pets[indexPath.row].imgId
                    let petDesc = Pet.pets[indexPath.row].imgDesc
            
                        let sectionZeroCell = tableView.dequeueReusableCell(withIdentifier: "firstSectionCell", for: indexPath) as! CustomTableViewCell
                        sectionZeroCell.imgView?.image = UIImage(named: imgId)
                        sectionZeroCell.txtLabel?.text = petName
                    sectionZeroCell.txtDesc?.text = petDesc
            
                        return sectionZeroCell
            
        }
            
       
       
        else{
            let sectionOneCell = tableView.dequeueReusableCell(withIdentifier: "nibCell", for: indexPath) as! nibCustomTableViewCell

            return sectionOneCell
        }
        }
       
    
}

extension MyViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
        performSegue(withIdentifier: "connector", sender: self)
        
       
        
    }
}

