import SwiftUI
import Firebase

struct MenuView: View {
    func logout() {
        do {
            try Auth.auth().signOut()
            print("succes logout")
        } catch {
            print("error logout")
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            HStack {
                GroupBox {
                    DisclosureGroup("Language") {
                        Text("English")
                        Text("Русский")
                        Text("Germanu")
                    }
                }
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Logout")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .onTapGesture {
                logout()
            }
            .padding(.top, 30)
            
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
