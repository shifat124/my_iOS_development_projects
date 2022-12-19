//
//  ExpenseModel.swift
//  table_view
//
//  Created by BJIT on 23/09/1401 AP.
//

import Foundation

struct Expense{
    var expense: String
    var expenseDesc: String
    var expenseAmount: String
}

extension Expense {
    static var expenseArray = [Expense(expense: "Travel", expenseDesc: "I will travel", expenseAmount: "3200")]
    
    
}
