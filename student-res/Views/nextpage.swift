//
//  nextpage.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//

import SwiftUI

enum auth{
    case login
    case signup
}

struct nextpage: View {
    @State private var authtype: auth = .login
    var body: some View {
      
            Picker("Auth Type", selection: $authtype) {
                Text("Log In").tag(auth.login)
                Text("Sign Up").tag(auth.signup)
            }
            .pickerStyle(.segmented)
            .padding()
          
            if(authtype == .login){
                login()
            }
            else{
                signup()
            }
       
    }
        }
    


#Preview {
    nextpage()
}
