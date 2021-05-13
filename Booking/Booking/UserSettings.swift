import Foundation
import Combine

final class UserSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    
    @UserDefault("tickets", defaultValue: [])
    var tickets: [Ticket] {
        willSet {
            objectWillChange.send()
        }
    }
}
