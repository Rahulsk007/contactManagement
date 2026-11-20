//
//  JSONService.swift
//  ContactManagement
//
//  Created by Sk Sahabuddin on 20/11/26.
//


import Foundation

struct JSONService {
    
    static func loadContacts() -> [ContactData] {
        
        // fiend the data file
        guard let url = Bundle.main.url(forResource: "contacts", withExtension: "json") else {
            print("JSON File not found")
            return []
        }
        
        do{
            
            // store data into a variable
            let data = try Data(contentsOf: url)
            
            
            // decoding the data and return
            let contacts = try JSONDecoder().decode([ContactData].self , from: data)
            return contacts
        }catch{
            print("JSON decoding error: \(error)")
            return []
        }
    }
}
