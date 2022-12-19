

import UIKit


class MyViewController: UIViewController{
   
    @IBOutlet weak var tableView: UITableView!
    var isUpdate = false
    var index = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //Nib register
        let nibHeader = UINib(nibName: "CustomHeaderView", bundle: nil)
        tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")

        
}
    //First page segue to second page
    @IBAction func secondBtnTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "connector", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "connector" {
            if let second = segue.destination as? SecondViewController{
                
                second.delegate = self
                if isUpdate == true{
                    second.updateExpense = Expense.expenseArray[index].expense
                    second.updateDescription = Expense.expenseArray[index].expenseDesc
                    second.updateAmount = Expense.expenseArray[index].expenseAmount
                    second.actionName = "update"
                }
            }
        }
    }
    
    func addItem(a: String, b: String, c: String){
        Expense.expenseArray.append(Expense(expense: a, expenseDesc: b, expenseAmount: c))
        tableView.reloadData()
    }
    func refreshTable(){
        tableView.reloadData()
        
    }
    
}

extension MyViewController: UITableViewDataSource{
    //FOR Header
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
//
//        var sum = 0
//        var i = 0
//        while i<Expense.expenseArray.count{
//            sum = sum + Expense.expenseArray.expenseAmount
//        }
//
//        sectionHeader.txtLabel.text = sum
//        return sectionHeader
//
//    }
    
    //For tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Expense.expenseArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let exp = Expense.expenseArray[indexPath.row].expense
        let expDesc = Expense.expenseArray[indexPath.row].expenseDesc
        let expAmo = Expense.expenseArray[indexPath.row].expenseAmount

            let sectionZeroCell = tableView.dequeueReusableCell(withIdentifier: "firstSectionCell", for: indexPath) as! CustomTableViewCell
            sectionZeroCell.expenseType?.text = exp
            sectionZeroCell.descriptionType?.text = expDesc
        sectionZeroCell.amountType?.text = expAmo

            return sectionZeroCell

    }

}

extension MyViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
}
    //for trailing delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: ""){_,_,completion in
            tableView.beginUpdates()
            Expense.expenseArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            completion(true)
            
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    //for leading swipe
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let msgAction = UIContextualAction(style: .normal, title: "Messeage"){[weak self] _,_,_ in
            guard let self = self else{
                return
        }
            self.isUpdate = true
            self.index = indexPath.row
            self.performSegue(withIdentifier: "connector", sender: nil)
            
        }
        
       
        return UISwipeActionsConfiguration(actions: [msgAction])
        }
    
    
}

