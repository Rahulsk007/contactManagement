//
//  ContactDetailView..swift
//  ContactManagement
//
//  Created by Sk Sahabuddin on 20/11/26.
//



import SwiftUI
import SwiftData

struct ContactDetailView: View {
    
    let contact: ContactModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Contact Details")
                .font(.title.bold())
            
            Text("First Name: \(contact.firstName)")
            
            Text("Last Name: \(contact.lastName)")
            
            Divider()
            
            Text("Phone Numbers")
                .font(.headline)
            
            ForEach(contact.phoneNumber) { phone in
                Text(phone.number)
            }
            
            Divider()
            
            Text("Email Addresses")
                .font(.headline)
            
            ForEach(contact.email) { email in
                Text(email.email)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Contact")
        .navigationBarTitleDisplayMode(.inline)
    }
}

