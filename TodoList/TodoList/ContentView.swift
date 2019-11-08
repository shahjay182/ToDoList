import SwiftUI


struct ContentView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest (fetchRequest: ToDoItem.getAllToDoItems())
    var toDoItems: FetchedResults<ToDoItem>
    @State private var newToDoItem = ""
    var body: some View {
        NavigationView{
                List{
                    Section(header: Text("What's Next"))
                    {
                
                        HStack
                            {
                                TextField("New Item", text: self.$newToDoItem)
                                
                                Button(action: {
                                    let toDoItem = ToDoItem(context: self.managedObjectContext)
                                    
                                    toDoItem.title = self.newToDoItem
                                    toDoItem.createdAt = Date()
                                    
                                    do
                                    {
                                        try self.managedObjectContext.save()
                                        
                                    }
                                    
                                    catch{
                                        print(error)
                                    }
                                    //reset storage
                                    self.newToDoItem = ""
                                   })
                                   {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(Color.green)
                                        .imageScale(.large)
                                   }
                             }
                    }.font(Font.headline)
                    Section(header: Text("To Do's"))
                    {
                        ForEach(self.toDoItems)
                        {
                            toDoItems in
                            ToDoItemView(title: toDoItems.title!, createdAt: "\(toDoItems.createdAt!)")
                        }
                            //To Delete a record, append delete
                            .onDelete
                            {
                                IndexSet in
                                let deleteItem = self.toDoItems[IndexSet.first!]
                                self.managedObjectContext.delete(deleteItem)
                                
                                do{
                                    try self.managedObjectContext.save()
                                }
                                
                                catch{
                                    print(error)
                                }
                        }
                    }
                }
                .navigationBarTitle(Text("My To DO List"))
                .navigationBarItems(trailing: EditButton())
               
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



