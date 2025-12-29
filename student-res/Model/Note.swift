//
//  Note.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 29/12/25.
//


//
//  NotesModel.swift
//  student-res
//
//  Created by Prabhnoor Kaur
//

import Foundation

struct Note: Identifiable, Codable {
    var id: String
    var name: String
    var url: String
    var semester: String
    var subject: String?
    var uploadedBy: String?
    var uploadedDate: Date?
    var isApproved: Bool
}

struct NoteSubmission: Identifiable, Codable {
    var id: String
    var name: String
    var url: String
    var semester: String
    var subject: String?
    var uploadedBy: String
    var uploadedDate: Date
    var status: String // "pending", "approved", "rejected"
}

