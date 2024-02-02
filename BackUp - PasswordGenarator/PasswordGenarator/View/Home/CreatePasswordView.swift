//
//  ContentView.swift
//  PasswordGenarator
//
//  Created by Pablo Rojas on 6/10/22.
//
import SwiftUI

struct CreatePasswordView: View {
    
    var data = RandomStringModel()

    @ObservedObject var cPModel: CreatePasswordViewModel
    
    @Environment(\.managedObjectContext)  var manageObjContext
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {

                VStack {
                    
                    VStack {
                        
                        if cPModel.createPassword.stepperValue >= 6 && cPModel.createPassword.stepperValue <= 9 {
                            
                            TipHomeView(title: "Tip", tip: "Passwords should have a minimum length of at least 8 characters")
                                .padding(.horizontal, 10)
                            
                        } else if cPModel.createPassword.stepperValue >= 10 && cPModel.createPassword.stepperValue <= 12 {
                            
                            TipHomeView(title: "Tip", tip: "Try to include special characters and numbers to get a stronger password")
                                .padding(.horizontal, 10)
                        } else if cPModel.createPassword.stepperValue >= 13 && cPModel.createPassword.stepperValue <= 15 {
                            
                            TipHomeView(title: "Tip", tip: "Passwords should contain Uppercase, Lowercase, Numbers and Symbols")
                                .padding(.horizontal, 10)
                        } else {
                            
                            TipHomeView(title: "Tip", tip: "If your password is out of date, it is recommended to create a new one")
                                .padding(.horizontal, 10)
                        }
                    }
                        
                        VStack {
                            
                            ToggleCard(title: "ABCD", isOn: $cPModel.createPassword.isOnUpperCase)
                
                                .font(cPModel.createPassword.isOnUpperCase == true ? .system(size: 19) : .system(size: 17))
                            
                            ToggleCard(title: "abcd", isOn: $cPModel.createPassword.isOnLowerCase)
                                
                                .font(cPModel.createPassword.isOnLowerCase == true ? .system(size: 19) : .system(size: 17))
                            
                            ToggleCard(title: "1234", isOn: $cPModel.createPassword.isOnNumbers)
                            
                                .font(cPModel.createPassword.isOnNumbers == true ? .system(size: 19) : .system(size: 17))
                            
                            ToggleCard(title: "!@#$", isOn: $cPModel.createPassword.isOnSymbols)
                            
                                .font(cPModel.createPassword.isOnSymbols == true ? .system(size: 19) : .system(size: 17))
                            
                        }
                    
                    StepperView(stepperValue: $cPModel.createPassword.stepperValue)
                        .padding(.top, 50)
                    
                    VStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            if !cPModel.createPassword.isOnUpperCase && !cPModel.createPassword.isOnLowerCase && !cPModel.createPassword.isOnNumbers && !cPModel.createPassword.isOnSymbols {
                                self.cPModel.createPassword.isPresentedResult = false
                                
                            } else {
                                
                                if cPModel.createPassword.isOnUpperCase == true{
                                    cPModel.createPassword.upperCaseLetters = data.upperCase
                                } else{
                                    cPModel.createPassword.upperCaseLetters = ""
                                    cPModel.createPassword.myResult = ""
                                }
                                
                                if cPModel.createPassword.isOnLowerCase {
                                    cPModel.createPassword.lowerCaseLetters = data.lowerCase
                                } else {
                                    cPModel.createPassword.lowerCaseLetters = ""
                                    cPModel.createPassword.myResult = ""
                                }
                                
                                if cPModel.createPassword.isOnNumbers {
                                    cPModel.createPassword.numbers = data.numbers
                                } else {
                                    cPModel.createPassword.numbers = ""
                                    cPModel.createPassword.myResult = ""
                                }
                                
                                if cPModel.createPassword.isOnSymbols{
                                    cPModel.createPassword.symbols = data.symbols
                                } else {
                                    cPModel.createPassword.symbols = ""
                                    cPModel.createPassword.myResult = ""
                                }
                                
                                cPModel.createPassword.myResult = data.randomWords(stepperValue: cPModel.createPassword.stepperValue, upperCase: cPModel.createPassword.upperCaseLetters, lowerCase: cPModel.createPassword.lowerCaseLetters, numbers: cPModel.createPassword.numbers, symbols: cPModel.createPassword.symbols)
                                
                                withAnimation {
                                    self.cPModel.createPassword.isPresentedResult.toggle()
                                    cPModel.createPassword.stepperValue = 6
                                    cPModel.createPassword.isOnUpperCase = false
                                    cPModel.createPassword.isOnLowerCase = false
                                    cPModel.createPassword.isOnNumbers = false
                                    cPModel.createPassword.isOnSymbols = false
                                    
                                    // saving every password created in history property
                                    let userData = History(context: manageObjContext)
                                    let saveContext = DataController()
                                    userData.history = cPModel.createPassword.myResult
                                    userData.date = Date()
                                    
                                    if cPModel.createPassword.myResult.isEmpty {
                                        userData.history = "password not created ⚠️"
                                    }else{
                                        saveContext.saveContext(context: manageObjContext)
                                    }
                                }
                                
                            }
                            
                        }){
                            
                            CreateButtonView()
                            
                        }
                        .padding(.bottom, 20)
                        .sheet(isPresented: $cPModel.createPassword.isPresentedResult) {
                            ResultView(progress: .constant(Int(10.0)), myResult: $cPModel.createPassword.myResult)
                            //.presentationDetents([.medium, .large])
                        }
                        
                    }
                }
            }
            
        }//Zstack
        .foregroundColor(colorScheme == .light ? .black : .white)
        .navigationBarTitle("", displayMode: .inline)//remove the white space on the top
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        CreatePasswordView(cPModel: sampleCreatePasswordViewModel)
        
    }
}
//.navigationBarTitle("", displayMode: .inline)//remove the white space on the top

