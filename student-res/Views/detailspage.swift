//
//  DetailsPage.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//

import SwiftUI

struct detailspage: View {
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
    @State var name: String = ""
    @State var enrollno: String = ""

    var body: some View {
        VStack{
            Text("Enter your details")
                .font(.headline)
                .foregroundStyle(Color.green)
                .fontWeight(.bold)
                .padding(.top,100)
               Spacer()
            VStack(alignment:.leading){
                Text("Enter your name")
                textfieldview(
                    data2:$name,
                    data:"Full Name"
                )
            }
            .padding(.bottom,20)
            VStack(alignment:.leading){
                Text("Enter your enrollment number")
                textfieldview(
                    data2:$enrollno,
                    data:"Enrollment number"
                )
            }
            .padding(.bottom,20)
            VStack(alignment:.leading){
                Text("Select your semester")
                Menu {
                    ForEach(semesters, id: \.self) { sem in
                        Button(sem) {
                            semselection = sem
                        }
                    }
                } label: {
                    HStack {
                        Text(semselection ?? "Semester")
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
            }
            .padding(.bottom,20)
            VStack(alignment:.leading){
                Text("Select your branch")
                Menu {
                    ForEach(branches, id: \.self) { sem in
                        Button(sem) {
                            branchselection = sem
                        }
                    }
                } label: {
                    HStack {
                        Text(branchselection ?? "Branch")
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
            Spacer()
            NavigationLink("Submit", destination: questionpapers())
                .padding(.bottom,40)
        }
    }
}

#Preview {
    detailspage()
}
