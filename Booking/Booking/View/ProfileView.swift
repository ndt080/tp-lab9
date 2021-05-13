import SwiftUI
import CoreData

struct ProfileView: View {
    @EnvironmentObject var str : Storage
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @FetchRequest(entity: BookingFlight.entity(), sortDescriptors: []) var flights: FetchedResults<BookingFlight>
    @FetchRequest(entity: LMAModel.entity(), sortDescriptors: []) var LMAs: FetchedResults<LMAModel>
    @State var title: String = ""
    @State var latitude: String = "0.0"
    @State var longitude: String = "0.0"
    
    func dateFormatter(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")
        return formatter.string(from: date)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Booking a ticket")) {
                if str.tickets.count == 0 {
                    Text("You do not have any purchased tickets").foregroundColor( Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)))
                } else {
                    List {
                        ForEach(str.tickets, id: \.self.id) { obj in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(obj.flight.title)
                                    Text("Departure: \(obj.flight.timeStart) \(dateFormatter(date: obj.date)) Duration: \(obj.flight.duration) hour").font(.subheadline).foregroundColor(.gray)
                                }
                                Spacer()
                                Text("\(String(Int(obj.flight.price)))$")
                            }
                        }
                    }

                }
                
            }
            Section(header: Text("Admin func")){
//                Button(action: {
//                    var obj = BookingFlight(context: self.moc)
//                    obj.title = "Minsk - Moscow"
//                    obj.price = 30.0
//                    obj.fromId = UUID(uuidString: "2A12B386-45CF-482D-9A2B-6AFC52788A25")!
//                    obj.toId = UUID(uuidString: "0E39B429-F3F2-4166-8519-9F81CCDF4C9E")!
//                    obj.timeStart = "15:00"
//                    obj.duration = "1"
//                    do {
//                        try moc.save()
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                    
//                }) {
//                    Text("Add")
//                }.disabled(true)
                List {
                    ForEach(flights, id: \.self) { language in
                        HStack(){
                            Text("Title: \(language.title); From: \(language.fromId); To: \(language.toId)").font(.subheadline).foregroundColor(.gray)
                            Spacer()
                            Button(action: {
                                moc.delete(language)
                                do {
                                    try moc.save()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }) {
                                Text("X")
                            }.disabled(true)
                        }
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

/*


 
 

 id = "2A12B386-45CF-482D-9A2B-6AFC52788A25";
 title = "Minsk National Airport";


 id = "A1C3084B-A866-42CC-81B0-115F2D53DC88";
 title = "John F.Kennedy International Airport";


 id = "37729369-8F08-4163-A980-5251BA150F44";
 title = "Shanghai Pudong International Airport";


 id = "AD1C6EDB-6D54-4F79-87A9-13F430EAACDB";
 title = "Dulles International Airport ";


 id = "0E39B429-F3F2-4166-8519-9F81CCDF4C9E";
 title = "Sheremetyevo International Airport ";


 id = "D5F9839C-7D4D-4654-953D-0F8E54166DFF";
 title = "Moscow Domodedovo Airport ";


 id = "5D330A2D-E5EF-495B-9B3D-45ABE2CCAD5F";
 title = "Hurghada International Airport ";
*/


