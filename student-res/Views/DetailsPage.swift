//
//  DetailsPage.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//

import SwiftUI

struct DetailsPage: View {
    @State private var semselection: String?
    @State private var branchselection: String?
       let semesters = [
           "Semester 1",
           "Semester 2",
           "Semester 3",
           "Semester 4",
           "Semester 5",
           "Semester 6",
           "Semester 7",
           "Semester 8"
       ]
    let branches = [
        "CS",
        "CSAI",
        "CSB",
        "IT"
    ]

    var body: some View {
        VStack{
            Menu {
                ForEach(semesters, id: \.self) { sem in
                    Button(sem) {
                        semselection = sem
                    }
                }
            } label: {
                HStack {
                    Text(semselection ?? "Select your semester")
                        .foregroundColor(semselection == nil ? .gray : .primary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(width:300,height:40)
                .background(Color(.systemGray6))
                .cornerRadius(4)
            }
            Menu {
                ForEach(branches, id: \.self) { sem in
                    Button(sem) {
                        branchselection = sem
                    }
                }
            } label: {
                HStack {
                    Text(branchselection ?? "Select your branch")
                        .foregroundColor(branchselection == nil ? .gray : .primary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(width:300,height:40)
                .background(Color(.systemGray6))
                .cornerRadius(4)
            }
            
            
        }
    }
}

#Preview {
    DetailsPage()
}
