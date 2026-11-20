//
//  ContactModel.swift
//  ContactManagement
//
//  Created by Sk Sahabuddin on 19/11/26.
//


import SwiftData

@Model
final class ContactModel {
    var firstName: String
    var lastName: String
    
    @Relationship(deleteRule: .cascade, inverse: \PhoneNumberModel.contact)
    var phoneNumber: [PhoneNumberModel] = []
    
    
    @Relationship(deleteRule: .cascade, inverse: \EmailModel.contact)
    var email: [EmailModel] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
