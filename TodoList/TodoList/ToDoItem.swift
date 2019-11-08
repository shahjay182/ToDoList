//
//  ToDoList.swift
//  TodoList
//
//  Created by Jay Shah on 2019-11-08.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import Foundation
import CoreData

// Create A Class to inherit from NSManagedObject

public class ToDoItem : NSManagedObject, Identifiable{
    @NSManaged public var createdAt : Date?
    @NSManaged public var title : String?
}

extension ToDoItem
{
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem>{
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key:"createdAt" , ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
