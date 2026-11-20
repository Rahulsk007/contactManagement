//
//  EmailModel.swift
//  ContactManagement
//
//  Created by Sk Sahabuddin on 19/11/26.
//
import SwiftData

@Model
final class EmailModel{
    var email: String
    
    var contact: ContactModel?
    
    init(email: String) {
        self.email = email
    }
}
