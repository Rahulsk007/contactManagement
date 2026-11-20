//
//  PhoneNumberModel.swift
//  ContactManagement
//
//  Created by Sk Sahabuddin on 19/11/26.
//


import SwiftData

@Model
final class PhoneNumberModel {
    var number: String
    
    var contact: ContactModel?
    
    init(number: String) {
        self.number = number
    }
}
