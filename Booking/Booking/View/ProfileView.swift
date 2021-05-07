import SwiftUI
import CoreData

struct ProfileView: View {
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @FetchRequest(entity: LMAModel.entity(), sortDescriptors: []) var LMAs: FetchedResults<LMAModel>
    @State var title: String = ""
    @State var latitude: String = "0.0"
    @State var longitude: String = "0.0"
    
    var body: some View {
        Form {
            Section(header: Text("Booking a ticket")) {
                Text("No routes selected")
            }
            Section(header: Text("Admin func")){
                TextField("enter title", text: $title)
                TextField("enter latitude", text: $latitude)
                TextField("enter longitude", text: $longitude)
                Button(action: {
                    let obj = LMAModel(context: self.moc)
                    obj.id = UUID()
                    obj.title = title
                    obj.latitude = Double(latitude) ?? 0.0
                    obj.longitude = Double(longitude) ?? 0.0
                    do {
                        try moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }) {
                    Text("Add")
                }
                List {
                    ForEach(LMAs, id: \.self) { language in
                        HStack(){
                            Text("Title: \(language.title), Id: \(language.id)")
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
                            }
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
