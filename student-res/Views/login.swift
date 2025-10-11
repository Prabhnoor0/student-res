//
//  login.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//

import SwiftUI

@MainActor
final class loginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func loginn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Email or passqword is empty")
            return
        }
        Task{
            do{
                let getReturnedUser = try await AuthenticationManager.shared.loginUser(email: email, password: password)
               
            }
            catch{
                print("Error\(error)")
            }
        }
    }
    
}
struct login: View {
    @StateObject var viewmodel = loginViewModel()
    @State var navigate: Bool = false
    var body: some View {
        VStack{
            Spacer()
            textfieldview(
                data2: $viewmodel.email,
                data: " Enter email"
            )
            
            textfieldview(
                data2: $viewmodel.password,
                data: " Enter password"
            )
            Spacer()
            Button("LogIn"){
                Task{
                    do{
                        try await viewmodel.loginn()
                        navigate=true
                    }
                    catch{
                        print("Error\(error)")
                    }
                }
            }
            .navigationDestination(isPresented:$navigate){
                questionpapers()
            }
            
        }
    }
}

#Preview {
    login()
}
