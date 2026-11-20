//
//  ContactData.swift
//  ContactManagement
//
//  Created by Sk Sahabuddin on 20/11/26.
//


import Foundation

struct ContactData: Codable {
    let firstName: String
    let lastName: String
    let phoneNumbers: [String]
    let emails: [String]
}
