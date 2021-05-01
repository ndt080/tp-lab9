import SwiftUI

struct MainView: View {
    @State var searchText: String = ""
    @EnvironmentObject var data : Storage
    
    var body: some View {
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
        Spacer()
    }
}
