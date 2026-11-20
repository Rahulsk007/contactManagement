
import SwiftUI
import SwiftData

struct ContentView: View  {
    @Environment(\.modelContext) private var context
    
    @State private var searchText = ""
    
    var body: some View{
        NavigationStack{
            ContactListView(searchText: searchText)
                .navigationTitle("Contacts")
                .searchable(text: $searchText, prompt: "Search Contacts")
        }
        .onAppear{
            ContactImportService.importContactsIntoSwiftData(context: context)
        }
    }
}


struct ContactListView: View {
    
    @Query private var contacts: [ContactModel]
    
    init(searchText: String) {
        let predicate = #Predicate<ContactModel> { contact in
            searchText.isEmpty ||
            contact.firstName.localizedStandardContains(searchText) ||
            contact.lastName.localizedStandardContains(searchText)
        }
        
        _contacts = Query(
            filter: predicate,
            sort: \ContactModel.firstName
        )
    }
    var body: some View {
       
        List(contacts) { contact in
            
            NavigationLink {
                ContactDetailView(contact: contact)
            } label: {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("\(contact.firstName) \(contact.lastName)")
                        .font(.headline)
                    
                    Text("\(contact.phoneNumber.count) phone numbers • \(contact.email.count) emails")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }

    }
}
