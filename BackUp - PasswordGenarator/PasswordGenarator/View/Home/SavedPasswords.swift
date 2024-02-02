//
//  SavedPasswords.swift
//  PasswordGenarator
//
//  Created by Pablo Rojas on 12/11/22.
//

/*
 NavigationLink(destination: DetailViewPassword(detailModel: DetailViewModel(detailView: DetailModel(siteName: data.unwrappedSiteName, userName: data.unwrappedUserName, password: data.unwrappedPassword)), dataUser: data)){
 Label(data.siteName ?? "profile not saved", systemImage: "person.circle.fill")
 }
 */

import SwiftUI
import CoreData

struct SavedPasswords: View {
    
    //@ObservedObject var savedPasswords: SavedPasswordsConstants
    @ObservedObject var sPModel: SavedPasswordsViewModel
    @StateObject var detailModel: DetailViewModel
    
    
    //CoreData
    @Environment(\.managedObjectContext)  var manageObjContext
    @Environment(\.colorScheme) var colorScheme
    @FetchRequest(entity: User.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)])
    
    private var passwordData: FetchedResults<User>
    
    var body: some View {
        
        ZStack {
            
            NavigationStack {
                
                List { //Every String is going to be the same id to show a detail view
                    ForEach(passwordData, id: \.self) { data in
                        VStack(alignment: .leading, spacing: 1) {
                            
                            NavigationLink(destination: DetailViewPassword(detailModel: DetailViewModel(detailView: DetailModel(siteName: data.unwrappedSiteName, userName: data.unwrappedUserName, password: data.unwrappedPassword)), dataUser: data)){
                                Label(data.siteName ?? "profile not saved", systemImage: "person.circle.fill")
                                    
                            }
                            
                            
                        }
                        //.minimumScaleFactor(0.5)
                        .textSelection(.enabled)
                        //.listRowBackground(Color("backgroundColor4"))
                        
                    }
                    .onDelete(perform: deleteUsers)
                    
                }
                
                .overlay(Group {
                    if passwordData.isEmpty {
                        VStack{
                            
                            NoHistoryBackgroundView(title: "No Profles")
                        }
                    }
                })
                .navigationBarItems(trailing:
                                        Button{
                    withAnimation {
                        self.sPModel.savedPassword.isPresentedUser.toggle()
                    }
                    
                }label: {
                    Image(systemName: "plus")
                        .frame(width: 44, height: 44)
                } .sheet(isPresented: $sPModel.savedPassword.isPresentedUser) {
                    
                    NewProfile(nPModel: sampleNewProfileModel)
                    //.presentationDetents([.fraction(0.6)])
                    //.presentationDetents([.medium, .large])
                })
                
                //.navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Profile", displayMode: .inline)
                //.listSectionSeparator(.hidden, edges: .bottom)
                .listStyle(.inset)
                //.searchable(text: searchQuery)
                .searchable(text: searchQuery, placement:
                        .navigationBarDrawer(displayMode: .automatic))
                .autocapitalization(.none)
                .padding(.top, 1)
                
                
            } //navigationStack
            .navigationBarHidden(true)
            
            
        }
        
        
        
        //        .scrollContentBackground(.hidden)
    }
    
    
    func deleteUsers(offsets: IndexSet) {
        offsets.map { passwordData[$0] }.forEach(manageObjContext.delete)
        let save = DataController()
        save.saveContext(context: manageObjContext)
    }
    
    var searchQuery: Binding<String> {
        Binding {
            sPModel.savedPassword.userToSearch
        } set: { newValue in
            sPModel.savedPassword.userToSearch = newValue
            guard !newValue.isEmpty else {
                passwordData.nsPredicate = nil
                return
            }
            passwordData.nsPredicate = NSPredicate(
                format: "siteName contains[cd] %@",
                newValue)
        }
    }
    
    
    
}


struct SavedPasswords_Previews: PreviewProvider {
    static var previews: some View {
        
        SavedPasswords(sPModel: sampleSavedPasswordsViewModel, detailModel: sampleDetailView)
    }
}
