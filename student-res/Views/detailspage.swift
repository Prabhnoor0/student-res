//
//  DetailsPage.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//

import SwiftUI
@MainActor
final class DetailsPageViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var enrollno: String = ""
    @Published var semselection: String?
    @Published var branchselection: String?
       let semesters = [
           "1",
           "2",
           "3",
           "4",
           "5",
           "6",
           "7",
           "8"
       ]
    let branches = [
        "CS",
        "CSAI",
        "CSB",
        "IT"
    ]
    func SaveUserInfo() async{
        
        do{
            guard let user = try? AuthenticationManager.shared.getauthenticateduser() else {
                           print("not found")
                            return
                        }
            let userData : [String : Any] = [
                "name" : name,
                "enrollmentnumber" : enrollno,
                "semester" : semselection ?? "",
                "branch" : branchselection ?? ""
                
            ]
            try await UserManager.shared.saveUserData(userId: user.uid, data: userData)
        }
        catch{
            print("Error \(error)")
        }
    }
}
struct detailspage: View {
    @StateObject var viewmodel = DetailsPageViewModel()
    @State var navigate : Bool = false
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
                    data2:$viewmodel.name,
                    data:"Full Name"
                )
            }
            .padding(.bottom,20)
            VStack(alignment:.leading){
                Text("Enter your enrollment number")
                textfieldview(
                    data2:$viewmodel.enrollno,
                    data:"Enrollment number"
                )
            }
            .padding(.bottom,20)
            VStack(alignment:.leading){
                Text("Select your semester")
                Menu {
                    ForEach(viewmodel.semesters, id: \.self) { sem in
                        Button(sem) {
                            viewmodel.semselection = sem
                        }
                    }
                } label: {
                    HStack {
                        Text(viewmodel.semselection ?? "Semester")
                            .foregroundColor(viewmodel.semselection == nil ? .gray : .primary)
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
                    ForEach(viewmodel.branches, id: \.self) { sem in
                        Button(sem) {
                            viewmodel.branchselection = sem
                        }
                    }
                } label: {
                    HStack {
                        Text(viewmodel.branchselection ?? "Branch")
                            .foregroundColor(viewmodel.branchselection == nil ? .gray : .primary)
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
            Button("Submit"){
                Task{
                    
                        guard !viewmodel.name.isEmpty,
                              !viewmodel.enrollno.isEmpty,
                              viewmodel.semselection != nil,
                              viewmodel.branchselection != nil else {
                            print("Please fill in all fields")
                            return
                        }
                       
                    await viewmodel.SaveUserInfo()
                        navigate=true
                   
                }
            }
            .navigationDestination(isPresented:$navigate){
                questionpapers()
            }
            .padding(.bottom,40)
            
        }
    }
    
    
}

#Preview {
    detailspage()
}
