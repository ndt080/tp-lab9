import SwiftUI
import UIKit
import CoreData
import Firebase


@main
struct MonumetsMinskApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
