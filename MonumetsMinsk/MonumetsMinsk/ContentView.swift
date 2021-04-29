import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var session = SessionStore()
    
    var body: some View {
        if(!session.isLoggedIn){
            SingInView()
        } else {
            HomeView()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
