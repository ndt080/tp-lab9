import SwiftUI

class Storage: ObservableObject {
    @Published var landmarks : [LandmarkAnnotation] = []
}
