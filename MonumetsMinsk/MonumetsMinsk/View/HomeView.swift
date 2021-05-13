import SwiftUI
import Firebase

struct HomeView: View {
    @State var selection = 0
    @State var searchText: String = ""
    @EnvironmentObject var data : Storage
    
    func logout() {
        do {
            try Auth.auth().signOut()
            print("succes logout")
        } catch {
            print("error logout")
        }
    }
    
    var body: some View {
        TabView(selection: $selection) {
            VStack(alignment: .trailing) {
                NavigationView{
                    List{
                        TextField(Translation.searchPlaceholderMonum,text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        ForEach(data.monuments.filter{$0.name.contains(searchText) || searchText == ""}, id: \.name){
                            obj in
                            NavigationLink(
                                destination: MonumentView(obj: obj)) {
                                RecordView(obj: obj)
                            }
                        }
                    }
                    .navigationBarHidden(true)
                }
            }
            .ignoresSafeArea(.all, edges: .all)
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text(Translation.titleNavAppIthem1)
            }
            VStack(alignment: .center, spacing: 10, content: {
                Text(Translation.logOutConfirmation)
                Button(action: {logout()}, label: {
                    Text(Translation.logout)
                })
            })
            .ignoresSafeArea(.all, edges: .all)
            .font(.system(size: 30, weight: .bold))
            .tabItem {
                VStack(){
                    Image(systemName: "square.and.arrow.up")
                    Text(Translation.logout)
                }
            }
        }.background(BlurView(style: .systemMaterial).opacity(0.8))
        .ignoresSafeArea(.all, edges: .all)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
