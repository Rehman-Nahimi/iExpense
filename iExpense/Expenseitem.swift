//
//  Expenseitem.swift
//  iExpense
//
//  Created by Ray Nahimi on 14/09/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
    
    
}
