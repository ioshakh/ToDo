//
//  ToDoListItem.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/16.
//

import Foundation
import RealmSwift

class ToDoListItem : Object , Codable {
    @objc dynamic var  item  : String = ""
    @objc dynamic var  date : Date = Date()
   
}
