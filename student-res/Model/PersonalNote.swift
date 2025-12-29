//
//  PersonalNote.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 29/12/25.
//


//
//  PersonalNoteModel.swift
//  student-res
//
//  Created by Prabhnoor Kaur
//

import Foundation

struct PersonalNote: Identifiable, Codable {
    var id: String
    var title: String
    var content: String
    var subject: String?
    var semester: String?
    var createdAt: Date
    var updatedAt: Date
}

