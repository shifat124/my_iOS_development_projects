//
//  SecondViewController.swift
//  table_view
//
//  Created by BJIT on 23/09/1401 AP.
//

import UIKit
class SecondViewController: UIViewController {
    //Delegate variable
    var delegate : MyViewController?
    //Outlet of second view controller
    @IBOutlet weak var enterExpense: UITextField!
    @IBOutlet weak var enterDescription: UITextField!
    @IBOutlet weak var enterAmount: UITextField!
    
    var updateExpense = ""
    var updateDescription = ""
    var updateAmount = ""
    var actionName = "add"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterExpense.text = updateExpense
        enterDescription.text = updateDescription
        enterAmount.text = updateAmount
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitInfo(_ sender: Any) {
        if actionName == "update"{
            Expense.expenseArray[delegate!.index].expense = enterExpense.text!
            Expense.expenseArray[delegate!.index].expenseDesc = enterDescription.text!
            Expense.expenseArray[delegate!.index].expenseAmount = enterAmount.text!
            delegate?.refreshTable()
           }else{
            delegate?.addItem(a: enterExpense.text!, b: enterDescription.text!, c: enterAmount.text!)
        }
        self.dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
