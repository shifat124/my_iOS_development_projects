

import UIKit

// var rowIndicator = 0
// var sectionIndicator = 0

class MyViewController: UIViewController{
    //Outlet Part
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inpTxt: UITextField!
    //Dummy Data by Array
    
    var arr:[String] = ["row 1", "row 2", "row 3"]

    //Append Data On TableView
    @IBAction func btnClicked(_ sender: Any) {
        
        arr.append(inpTxt.text!)
        tableView.reloadData()
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }


}

extension MyViewController: UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstSectionCell", for: indexPath) as! CustomTableViewCell
        cell.txtLabel.text = arr[indexPath.row]
        
            return cell


        }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .fade)
        arr.remove(at: indexPath.row)
        tableView.endUpdates()
        
        
        
    }
       
    
}

extension MyViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

