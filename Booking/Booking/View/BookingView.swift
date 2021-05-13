import SwiftUI
import MapKit
import CoreData

struct BookingView: View {
    @EnvironmentObject var str : Storage
    var local = UserSettings()
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @FetchRequest(entity: BookingFlight.entity(), sortDescriptors: []) var flights: FetchedResults<BookingFlight>
    @FetchRequest(entity: LMAModel.entity(), sortDescriptors: []) var LMAs: FetchedResults<LMAModel>
    @Binding var routeAnnotation: [MKAnnotation]
    @State private var selection = 0
    @State private var isSelection = false
    @State private var isPay = false
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
                                ForEach(flights.indices, id: \.self) { index in
                                    if flights[index].fromId == self.LMAs.first(where: { $0.title == (routeAnnotation[0].title)})?.id
                                        &&
                                       flights[index].toId == self.LMAs.first(where: { $0.title == (routeAnnotation[1].title)})?.id
                                    {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(flights[index].title)
                                                Text(flights[index].duration + "hour").font(.subheadline).foregroundColor(.gray)
                                            }
                                            Spacer()
                                            Text(flights[index].timeStart)
                                        }
                                        .tag(index)
                                    }
                                }
                            }
                        }.onChange(of: selectionflight) { newValue in
                            isSelection = true
                        }
                        .animation(.easeInOut(duration: 0.5))
                    }
                }
                
                Section(header: Text("Ticket price")) {
                    HStack(alignment: .bottom){
                        Text("Total: ")
                        Spacer()
                        Text(isSelection ? String(Int(flights[selectionflight].price)) + "$" : "none")
                    }
                }
                if isSelection{
                    Button(action: {
                        let ticket = Ticket(firstName: firstname, lastName: lastname, date: date, flight: flights[selectionflight])
                        str.tickets.append(ticket)
//                        local.tickets = obj
                        isPay = true
                    }) {
                        Text("Pay")
                    }
                    .foregroundColor( Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)))
                    .frame(width: UIScreen.main.bounds.width-65, height: 44)
                    .actionSheet(isPresented: $isPay) {
                        ActionSheet(title: Text("Ticket paid successfully!"), buttons: [.default(Text("Ok"))])
                    }
                } else {
                    Text("Payment is not possible. No flights selected").foregroundColor( Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)))
                }
                
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
