import SwiftUI
import MapKit
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @State private var selection = 0
    @State var isActive: Bool = false
    @State var selectedAnnotation: MKAnnotation?
    @State var routeAnnotation: [MKAnnotation] = []
    @Binding var landmarks: [LandmarkAnnotation]
    @EnvironmentObject var str : Storage
    
    var body: some View {
        TabView(selection: $selection) {
            ZStack(){
                MapView(landmarks: $landmarks, isClicked: $isActive, selectedAnnotation: $selectedAnnotation)
                    .ignoresSafeArea(.all, edges: .all)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                RouteFormView(isActive: $isActive, routeAnnotation: $routeAnnotation, selectedAnnotation: $selectedAnnotation)
                    .offset(y: isActive ? 0 : 600)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    .gesture(
                        DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                            .onEnded { value in
                                if value.translation.height > 0 && value.translation.width < 100 && value.translation.width > -100 {
                                    isActive = false
                                }
                            }
                    )
            }
            .tabItem {
                Image(systemName: "map")
                Text("map")
            }
            VStack {
                if routeAnnotation.count < 2 {
                    DontBookingView()
                        .environment(\.managedObjectContext, moc)
                } else {
                    BookingView(routeAnnotation: $routeAnnotation)
                }
            }
            .tabItem {
                Image(systemName: "airplane")
                Text("Booking")
            }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .background(BlurView(style: .systemMaterial))
        .ignoresSafeArea(.all, edges: .all)
    }
}
