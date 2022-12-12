

import UIKit


class MyViewController: UIViewController{
    //Outlet Part
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inpTxt: UITextField!
    //Dummy Data by Array
    
    var arr:[String] = ["ROW 1", "ROW 2", "ROW 3"]
    
    //Append Data On TableView
    @IBAction func btnClicked(_ sender: Any) {
        
        arr.append(inpTxt.text!)
        tableView.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nibHeader = UINib(nibName: "CustomHeaderView", bundle: nil)
        tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        let nibFooter = UINib(nibName: "CustomFooterView", bundle: nil)
        tableView.register(nibFooter, forHeaderFooterViewReuseIdentifier: "CustomFooterView")
        
    }
    
    
}

extension MyViewController: UITableViewDataSource{
    //FOR Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
        sectionHeader.txtLabel.text = "THIS IS SECTION 1 HEADER!!"
        
        
        return sectionHeader
        
    }
    //For Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomFooterView") as! CustomFooterView
        sectionFooter.footTxtLabel.text = "THIS IS SECTION 1 FOOTER!!"
        return sectionFooter
    }
    //End for footer section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
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

