import SwiftUI
import SwiftData

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
            ContactModel.self,
            PhoneNumberModel.self,
            EmailModel.self
        ])
    }
}
