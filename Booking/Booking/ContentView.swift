import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selection = 0
    @State var isActive: Bool = false
    @State var selectedAnnotation: MKAnnotation?
    @State var routeAnnotation: [MKAnnotation] = []
    
    var body: some View {
        TabView(selection: $selection) {
            ZStack(){
                MapView(isClicked: $isActive, selectedAnnotation: $selectedAnnotation)
                    .ignoresSafeArea(.all, edges: .all)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                RouteFormView(isActive: $isActive, routeAnnotation: $routeAnnotation, selectedAnnotation: $selectedAnnotation)
                    .offset(y: isActive ? 0 : 600)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                
            }
            .tabItem {
                Image(systemName: "map")
                Text("map")
            }
            VStack {
                if routeAnnotation.count < 2 {
                    Form {
                        Section(header: Text("Booking a ticket")) {
                            Text("No routes selected")
                        }
                    }
                } else {
                    BookingView()
                }
            }
            .tabItem {
                Image(systemName: "airplane")
                Text("Booking")
            }
            Text("Profile Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .background(BlurView(style: .systemMaterial))
        .ignoresSafeArea(.all, edges: .all)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
