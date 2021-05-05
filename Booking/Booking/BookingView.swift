import SwiftUI

struct BookingView: View {
    @State private var selection = 0
    @State var data: [Weather] = []

    
    var body: some View {
        Form {
            Section(header: Text("Results")) {
                
                Button("press", action: {
                    Api().getWeather{ (data) in
                        let tmp = data
                    }
                })
                List(data) { dat in
                    VStack{
                        Text(dat.name)
                    }
                }
                .onAppear(){
                    Api().getWeatherArray{ (data) in
                        self.data = data
                        
                    }
                }
            }
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
