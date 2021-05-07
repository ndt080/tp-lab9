import SwiftUI

class Storage: ObservableObject {
    @Published var landmarks : [LandmarkAnnotation] = []
    @Published var tickets : [Ticket] = UserSettings().tickets
}
