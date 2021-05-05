import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var session = SessionStore()
    
    var body: some View {
        if(!session.isLoggedIn){
            SingInView()
        } else {
            HomeView().environmentObject(Storage())
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .environment(\.locale, .init(identifier: "ru"))
    }
}
