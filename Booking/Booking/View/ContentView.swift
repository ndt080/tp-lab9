import SwiftUI
import MapKit
import CoreData

struct ContentView: View {
    @FetchRequest(entity: LMAModel.entity(), sortDescriptors: []) var LMAs: FetchedResults<LMAModel>
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @State var landmarks: [LandmarkAnnotation] = []
    
    var body: some View {
        MainView(landmarks: $landmarks)
            .environmentObject(Storage())
            .onAppear(){
                var data: [LandmarkAnnotation] = []
                for obj in LMAs {
                    data.append(LandmarkAnnotation(title: obj.title,
                                                   coordinate: .init(latitude: obj.latitude,
                                                                     longitude: obj.longitude)
                    ))
                }
                landmarks = data
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
