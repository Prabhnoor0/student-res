//
//  homepage.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct homepage: View {
    @State var navigate:Bool = false
    var body: some View {
        NavigationStack{
                VStack{
                    Spacer()
                    Text("Welcome to Student-res")
                        .font(.system(size: 43, weight: .bold, design: .default))
                        .foregroundStyle(.conicGradient(.init(colors: [.blue, .red,.orange,.purple]),
                                                        center:.topLeading)
                        )
                    Spacer()
                    Text("Click anywhere to continue")
                        .font(.caption)
                        .fontWidth(.expanded)
                        .foregroundStyle(.gray)
                        .padding(.bottom, 100)
                    
                }
                .onTapGesture {
                    navigate=true
                }
                .navigationDestination(isPresented: $navigate) {
                    if Auth.auth().currentUser != nil {
                        newpage()
                    } else {
                        nextpage()
                    }
                    
                }
            }
    }
}

#Preview {
    homepage()
}
