//
//  NewProfile.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 24/11/22.
//

import SwiftUI

struct NewProfile: View {
    
    //@ObservedObject var newProfile: NewProfileConstants
    @ObservedObject var nPModel: NewProfileViewModel
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.managedObjectContext)  var manageObjContext
    @Environment(\.dismiss)  var dismiss
   

    
    var body: some View {
        
        
        NavigationStack {
            
            List {
                
                Section(header: Text("WebSite")) {
                    
                    TextField("website", text: $nPModel.newProfile.siteName)

                        .textSelection(.enabled)
                }
                
                Section(header: Text("Username")) {
                    
                    TextField("user", text: $nPModel.newProfile.userName)
                        .textSelection(.enabled)
                }
                
                Section(header: Text("Password")) {
                    
                    HStack {
    
                        EyeView(passText: $nPModel.newProfile.password, placeholder: "password")
                        
                    }
                    .padding(.horizontal, -9)
                }
                    
                    HStack {
                        
                        Button("Save")  {
                            
                            let userData = User(context: manageObjContext)
                            let save = DataController()
                            
                            if  nPModel.newProfile.siteName == "" || nPModel.newProfile.userName == "" || nPModel.newProfile.password == ""{
                                
                                nPModel.newProfile.isValidate = false
                                
                            }else{
                                
                                withAnimation {
                                    userData.siteName = nPModel.newProfile.siteName
                                    userData.userName = nPModel.newProfile.userName
                                    userData.password = nPModel.newProfile.password
                                    userData.date = Date()
                                    
                                    save.saveContext(context: manageObjContext)
                                    
                                    nPModel.newProfile.siteName = ""
                                    nPModel.newProfile.userName = ""
                                    nPModel.newProfile.password = ""
                                    dismiss()
                                }
                            }
                            
                        }
                        .bold()
    
                    }// hstack
            }
            .navigationTitle("Save Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button{
                withAnimation {
                    dismiss()
                }
                
                
            }label: {
//                XButtonView(symbolName: "xmark.circle.fill", colorName: Color(.label))
                Image(systemName: "xmark.circle.fill")
                    .frame(width: 44, height: 44)
                    .foregroundStyle(Color(.label))
            }
            )}
        }
        
//        .onAppear {
//#if DEBUG
//            UserDefaults.standard.set(true, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
//#endif
//        }
        
    }


struct NewProfile_Previews: PreviewProvider {
    static var previews: some View {
        NewProfile(nPModel: sampleNewProfileModel)
    }
}
