import SwiftUI

class Storage: ObservableObject {
    @Published var monuments : [Monument] = GetMonumentsWithPlist()
    @Published var sculptors : [Sculptor] = GetSculptorsWithPlist()
}
