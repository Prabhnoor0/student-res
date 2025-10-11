//
//  textfriledview.swift
//  student-res
//
//  Created by Prabhnoor Kaur on 11/10/25.
//

import Foundation
import SwiftUI

struct textfieldview: View {
    @Binding var data2: String
    var data: String
    var body: some View {
        TextField(data, text:$data2)
            .frame(width:300, height:50)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}
struct securefieldview: View {
    @Binding var data2: String
    var data: String
    var body: some View {
        SecureField(data, text:$data2)
            .frame(width:300, height:50)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

