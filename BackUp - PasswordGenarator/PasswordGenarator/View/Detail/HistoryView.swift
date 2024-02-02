//
//  HistoryView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 9/4/23.
//

import SwiftUI
import CoreData
    
struct HistoryView: View {

    //CoreData
    @Environment(\.managedObjectContext)  var manageObjContext
    @FetchRequest(entity: History.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)])
 
    private var passwordHistory: FetchedResults<History>
   
    @State var newDate = Date()
    
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        
        NavigationStack {
            List { //Every String is going to be the same id to show a detail view
                ForEach(passwordHistory, id: \.self) { history in
                    
                    VStack(alignment: .leading){
                        
                        Text(history.unwrappedHistory)
                        .textSelection(.enabled)
                        
                        Text(calculateTime(date: history.date ?? newDate))
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                            .onReceive(timerManager.$currentTime) { _ in}
                    }
                    
                }
                .onDelete(perform: deleteUsers)
            }
            .overlay(Group {
                if passwordHistory.isEmpty {
                    
                    NoHistoryBackgroundView(title: "No history")
                }
            })
            .listStyle(.inset)
            .toolbar{
                
                Menu {
                    
                    Button {
                        
                        deleteAllItems()
                        
                    } label: {
                        
                        Text("Clear history")
                    }
                    
                    EditButton()
                    
                }label: {
                    Label("Menu", systemImage: "slider.horizontal.3")
                }
     
          }
         .navigationBarTitle("History", displayMode: .inline)
        }
        .navigationBarHidden(true)
    }
    
    func deleteUsers(offsets: IndexSet) {
        offsets.map { passwordHistory[$0] }.forEach(manageObjContext.delete)
        let save = DataController()
        save.saveContext(context: manageObjContext)
    }
    
    func deleteAllItems() {
        let context = manageObjContext
        let saveContex = DataController()
        // Delete the objects
        //loop items
        for items in passwordHistory {
            context.delete(items)
        }
        // Save the deletions to the persistent store
        saveContex.saveContext(context: context)
    }
    
    
   
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        HistoryView()
    }
}
