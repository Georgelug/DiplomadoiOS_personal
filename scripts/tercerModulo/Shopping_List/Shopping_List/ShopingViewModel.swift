//
//  ShopingViewModel.swift
//  Shopping_List
//
//  Created by Jorge Esparza on 20/05/24.
//

import Foundation



class ShopingViewModel {
    var items : [String]
    
    init() {
        items = [
            "Apples",
            "Bananas",
            "Garlic",
            "Meat",
            "Cheese",
        ]
    }
    
    func getCountArray() -> Int {
        items.count
    }
    
    func getItemOfItems (index: IndexPath) -> String{
        items[index.row]
    }
    
    func addItem (item : String){
        items.append(item)
    }
    
    func deleteItem (item : String){
        items.removeAll {$0 == item}
    }
    
    func deleteItem (at : IndexPath){
        items.remove(at: at.row)
    }
}

