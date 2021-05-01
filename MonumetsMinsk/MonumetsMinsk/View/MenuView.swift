import SwiftUI
import Firebase

struct MenuView: View {
    @ObservedObject var settings = UserSettings()
    
    func logout() {
        do {
            try Auth.auth().signOut()
            print("succes logout")
        } catch {
            print("error logout")
        }
    }
    func setLocale(locale : String){
        switch locale {
        case "en":
            print("Succes set locale")
        case "ru":
            print("Succes set locale")
        case "ge":
            print("Succes set locale")
        default:
            print("Unknown locale!")
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text(settings.userName)
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            HStack {
                GroupBox {
                    DisclosureGroup(Translation.titleNavApp) {
                        Button(action: {
                            setLocale(locale: "en")
                        }, label: {
                            Text(Translation.titleNavAppIthem1).foregroundColor(.green)
                        })
                        Button(action: {
                            setLocale(locale: "ru")
                        }, label: {
                            Text(Translation.titleNavAppIthem2)
                        }).padding(.top, 0.5)
                    }
                }
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text(Translation.logout)
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
