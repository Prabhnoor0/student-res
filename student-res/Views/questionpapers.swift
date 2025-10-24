//
//  newpage.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct questionpapers: View {
    @State var questionpapers: [QuestionPaper] = []
    @State var isloading: Bool = true
    var body: some View {
        VStack{
            Text("Question Papers")
                .foregroundStyle(.black)
                .frame(width:200, height: 50)
            if(isloading){
                Text("Fetching question papers...")
            }
            else if(questionpapers.isEmpty){
                Text("Question papers not available")
            }else{
                List(questionpapers){ paper in
                    Button(paper.name)
                    {
                        openpdf(url: paper.url)
                    }
                }
                
            }
        }
        .onAppear{
            quespaperss()
        }
    }
        
    
    
    
    func quespaperss(){
        isloading = true
        QuestionPaperService.quespaper.fetchquespapers{ papers in
            questionpapers = papers
            isloading = false
            
        }
    }
    func openpdf(url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
}

#Preview {
    questionpapers()
}
