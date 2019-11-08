//
//  ToDoItemView.swift
//  TodoList
//
//  Created by Jay Shah on 2019-11-08.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title) . font(.headline)
                Text(createdAt) . font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "My To Do List", createdAt: "Today")
    }
}
