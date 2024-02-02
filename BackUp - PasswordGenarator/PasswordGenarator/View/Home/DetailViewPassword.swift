//
//  DetailViewPassword.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 21/3/23.
//

import SwiftUI

struct DetailViewPassword: View {// This is a view to show a Detailed View of each profile saved
    
    @ObservedObject var detailModel: DetailViewModel
    
    @Environment(\.dismiss)  var dismiss
    
    //coredata
    @Environment(\.managedObjectContext)  var manageObjContext

    var dataUser: FetchedResults<User>.Element  // this is used to bring the atributes from User footer: Text("You can type your webpage name")
    
    var body: some View {
        
        NavigationStack {

            List {
               
                Section(header: Text("WebSite")) {
                    
                    TextField("new website", text: $detailModel.detailView.siteName)
                        .textSelection(.enabled)
                }
                .padding(.horizontal, -10)
                Section(header: Text("Username")) {
                    
                    TextField("new user", text: $detailModel.detailView.userName)
                        .textSelection(.enabled)

                }
                .padding(.horizontal, -10)
                Section(header: Text("Password")) {
                
                    EyeView(passText: $detailModel.detailView.password, placeholder: "new password")
                    
                }
                .padding(.horizontal, -10)

                Button("Update") {//button goes inside of the list to show it as an element in the list
                    withAnimation{
                        // valdiate is a textfield has been changed or hasn't
                        if detailModel.detailView.siteName.isEmpty || detailModel.detailView.userName.isEmpty || detailModel.detailView.password.isEmpty {
                            
                            detailModel.detailView.isValidate = false
                            
                        }else if detailModel.detailView.siteName == dataUser.siteName && detailModel.detailView.userName == dataUser.userName
                                    && detailModel.detailView.password == dataUser.password { // if everyone is equal, can't be saved
                            
                            detailModel.detailView.isValidate = false
                            
                        }else{ // changes can be saved
                            dataUser.siteName = detailModel.detailView.siteName
                            dataUser.userName = detailModel.detailView.userName
                            dataUser.password = detailModel.detailView.password
                            
                            detailModel.detailView.isValidate = true
                            
                            let save = DataController()
                            save.saveContext(context: manageObjContext)
                            
                            dismiss()
                            
                        }
                        
                    }
                    
                    
                }
                .bold()
                
            }//list
            .navigationTitle("\(detailModel.detailView.siteName)")
        }//MARK: - navigation
        
    }
}

struct DetailViewPassword_Previews: PreviewProvider {
    static var previews: some View {
        let user = User()
        
        DetailViewPassword(detailModel: sampleDetailView, dataUser: user)
    }
}
