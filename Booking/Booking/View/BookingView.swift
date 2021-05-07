import SwiftUI
import MapKit
import CoreData

struct BookingView: View {
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @FetchRequest(entity: BookingFlight.entity(), sortDescriptors: []) var flights: FetchedResults<BookingFlight>
    
    @Binding var routeAnnotation: [MKAnnotation]
    @State private var selection = 0
    @State private var selectionflight = 0
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Selected route")) {
                    HStack(){
                        Text("From: " + (routeAnnotation[0].title)!!)
                    }
                    HStack(){
                        Text("To: " + (routeAnnotation[1].title)!!)
                        
                    }
                }
                Section(header: Text("Boogking a ticket")) {
                    HStack(){
                        Text("First name: ")
                        TextField("enter first name", text: $firstname)
                    }
                    HStack(){
                        Text("Last name: ")
                        TextField("enter last name", text: $lastname)
                    }
                    HStack(){
                        DatePicker("Flight date:", selection: $date, displayedComponents: .date)
                    }
                }
                Section(header: Text("Choosing a flight")) {
                    VStack(){
                        Picker(selection: $selectionflight, label: Text("")) {
                            List {
                                ForEach(flights, id: \.self) { fl in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("asfsf")
                                            Text("trail.location").font(.subheadline).foregroundColor(.gray)
                                        }
                                        Spacer()
                                        Text("11:15")
                                    }.tag(0)
                                }
                            }
                        }.animation(.easeInOut(duration: 0.5))
                    }
                }
                Section(header: Text("Ticket price")) {
                    HStack(alignment: .bottom){
                        Text("Total: ")
                        Spacer()
                        Text("15$")
                    }
                }
                Button(action: {
                    
                    
                }) {
                    Text("Pay")
                }
                .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)))
                .frame(width: UIScreen.main.bounds.width-65, height: 44)
            }
            .navigationBarHidden(true)
        }
    }
    
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(routeAnnotation: .constant([
            LandmarkAnnotation(title: "Национальный аэропорт Минск",
                               coordinate: .init(latitude: 53.890632, longitude: 28.033768)),
            LandmarkAnnotation(title: "Национальный аэропорт Минск",
                               coordinate: .init(latitude: 53.890632, longitude: 28.033768))
        ]))
    }
}
