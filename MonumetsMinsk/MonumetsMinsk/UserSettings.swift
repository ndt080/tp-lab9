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
    
    @UserDefault("isAuth", defaultValue: false)
    var isAuth: Bool {
        willSet {
            objectWillChange.send()
        }
    }
}
