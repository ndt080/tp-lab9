import SwiftUI
import Firebase

struct HomeView: View {
    func logout() {
        do {
            try Auth.auth().signOut()
            print("succes logout")
        } catch {
            print("error logout")
        }

    }
    
    var body: some View {
        VStack(){
            Button(action: {
                logout()
            }, label: {
                Text("exit")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            })
            
            
            
            
          
            
            
            
            
            
            
        }
        
        

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
