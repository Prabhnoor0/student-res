//
//  QuestionPaperService.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 24/10/25.
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

final class QuestionPaperService {
    static let quespaper = QuestionPaperService()
    func fetchquespapers(completion: @escaping ([QuestionPaper]) -> Void){
       
        
        UserService.shared.getsemester{ sem in
            guard let semester = sem else {
                print("sem not found")
                completion([])
                return
            }
            var collection: String = "Questionpaperspdf\(semester)"
            let db = Firestore.firestore()
            db.collection(collection).getDocuments { snapshot, error in
                if let err=error {
                    print("error occured \(err)")
                    completion([])
                    return
                }
                let papers:[QuestionPaper] = snapshot?.documents.map{ doc in
                    let data = doc.data()
                    return QuestionPaper(
                        id: doc.documentID,
                        name: data["name"] as! String,
                        url: data["url"] as! String
                    )
                    
                } ?? []
                completion(papers)
            }
            
        }
        
    }
}

