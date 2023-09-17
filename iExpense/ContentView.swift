//
//  ContentView.swift
//  iExpense
//
//  Created by Ray Nahimi on 14/09/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
   
    var body: some View {
         NavigationView {
             List{
                 Section{
                     
                     ForEach(expenses.items) { item in
                         if item.isPersonal {
                             HStack{
                                 VStack(alignment: .leading){
                                     Text(item.name)
                                         .modify(for: item.amount)
                                     Text(item.type)
                                 }
                                 Spacer()
                                 
                                 Text(item.amount, format:.currency(code: "USD"))
                             }
                         } else {
                         }
                         
                     }
                     .onDelete(perform: removeItems)
                 }header: {
                     Text("Personal")
                 }
                 Section{
                     
                     ForEach(expenses.items) { item in
                         if !item.isPersonal {
                             HStack{
                                 VStack(alignment: .leading){
                                     Text(item.name)
                                         .modify(for: item.amount)
                                     Text(item.type)
                                 }
                                 Spacer()
                                 
                                 Text(item.amount, format:.currency(code: "USD"))
                             }
                             
                         }
                     }
                     .onDelete(perform: removeItems)
                 }header: {
                     Text("Business")
                 }
             }
             .navigationTitle("iExpense")
             .toolbar {
                 Button {
                     showingAddExpense = true
                 } label: {
                     Image(systemName: "plus")
                 }
             }
             .sheet(isPresented: $showingAddExpense){
                 AddView(expenses: expenses)
                 
             }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
