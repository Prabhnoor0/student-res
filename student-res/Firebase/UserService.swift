//
//  UserService.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 12/10/25.
//


import FirebaseAuth
import FirebaseFirestore

final class UserService {
    static let shared = UserService()
    private let db = Firestore.firestore()
    
    func saveUserData(uid: String, data: [String: Any], completion: ((Error?) -> Void)? = nil) {
        db.collection("users").document(uid).setData(data, merge: true) { error in
            completion?(error)
        }
    }
    
    func fetchUserData(uid: String, completion: @escaping ([String: Any]?) -> Void) {
        db.collection("users").document(uid).getDocument { document, error in
            completion(document?.data())
        }
    }
    func getsemester(completion: @escaping (String?) -> Void){
        guard let usercurr =  Auth.auth().currentUser else{
            completion(nil)
            return
        }
        let id = usercurr.uid
            fetchUserData(uid: id) { data in
                if let info = data{
                    if let semester = info["semester"] as? String{
                        completion(semester)
                    }else{
                        completion(nil)
                }
            }
        }
        
        
    }
}
