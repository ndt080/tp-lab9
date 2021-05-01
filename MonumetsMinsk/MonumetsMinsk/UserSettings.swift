import Foundation
import Combine

final class UserSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @UserDefault("ShowOnStart", defaultValue: true)
    var showOnStart: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault("userName", defaultValue: "User")
    var userName: String {
        willSet {
            objectWillChange.send()
        }
    }
}
