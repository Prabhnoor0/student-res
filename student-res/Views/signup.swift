//
//  signup.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//


   import SwiftUI

@MainActor
final class signupviewmodel:ObservableObject{
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var confirmpassword:String = ""
    
    
    func signupp() async throws{
        guard !email.isEmpty, !password.isEmpty,
              !confirmpassword.isEmpty else {
            print("not found")
            return
        }
        guard password == confirmpassword else {
               print("Passwords do not match")
               return
           }
        Task{
            do{
                
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
            }
            catch{
                print("Error \(error)")
            }
        }
    }
}
struct signup:View{
    @StateObject var viewmodel = signupviewmodel()
    @State private var navigate = false
    var body: some View {
     
        VStack{
            Spacer()
            textfieldview(
                data2: $viewmodel.email,
                            data: " Enter email"
                        )
            
            securefieldview(
                data2: $viewmodel.password,
                            data: " Enter password"
                        )
            securefieldview(
                data2: $viewmodel.confirmpassword,
                            data: " Enter password again to confirm"
                        )
            Spacer()
            Button("SignUp"){
                Task{
                    do{
                        try await viewmodel.signupp()
                        navigate=true
                    }
                    catch{
                        print("Error \(error)")
                    }
                }
            }
            .navigationDestination(isPresented: $navigate) {
                            newpage()
                        }
        }
        
    }
}
