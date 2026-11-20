//
//  ContactImportService.swift
//  ContactManagement
//
//  Created by Sk Sahabuddin on 20/11/26.
//

// Import JSON Data into SwiftData


import Foundation
import SwiftData

struct ContactImportService{
    
    static func importContactsIntoSwiftData(context: ModelContext) {
        
        // Check If Contacts already isto SwiftData's database
        let descriptor = FetchDescriptor<ContactModel>()
        
        do{
            let existingContacts = try context.fetch(descriptor)
            
            guard existingContacts.isEmpty else{
                print("Contacts are already importted JSON to SwiftData Data base")
                return
            }
                
                //Load JSON data [ContactData]
                let contactDataJSON = JSONService.loadContacts()
                
                
                //Convert JSON Data into SwiftData Model
                for item in contactDataJSON {
                    let contact = ContactModel(
                        firstName: item.firstName,
                        lastName: item.lastName
                    )
                    for number in item.phoneNumbers{
                        let phone = PhoneNumberModel(number: number)
                    }
                    for email in item.emails{
                        let email = EmailModel(email: email)
                    }
                    
                    //Insert contact
                    context.insert(contact)
                }
            
            try context.save()
            print("Contacts imported successfully JSON to swiftData")
        }catch{
            print("IMPORT ERRIR: \(error)")
        }
    }
}
