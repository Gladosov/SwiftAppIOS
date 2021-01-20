//
//  ToDoItem.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 08.01.2021.
//

import Foundation

public struct ToDoItem: Codable{

    let title: String?
    let deadLine: String?
}
var DO: [String] = ["HERE You CAN create ALL"]
func addItem(nameItem:String) {
    DO.append(nameItem)
    saveData()
}
func saveData(){
    
}
