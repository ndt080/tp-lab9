import SwiftUI

struct MonumentView: View {
    @EnvironmentObject var data : Storage
    var obj: Monument
    
    func HUITA(date : Date) -> String {
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "d MMM y"
        return formatter3.string(from: date)
    }
    
    
    var body: some View {
        ScrollView{
            VStack(){
                VStack(alignment: .leading){
 
                    Text(obj.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                    Text("Date opening: " + HUITA(date: obj.year))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.systemGray))
                    Text("Architector: " + String(data.sculptors[obj.authorId].name))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.systemGray))
                }
                .padding(.all, 20)
                .frame(minWidth: 327, minHeight: 109, alignment: .leading)
                .shadow(radius: 50)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.75)]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .padding(.bottom, 75)
                
                VStack(alignment: .leading){
                    Text(obj.description)
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color.black)
                }
                .padding(.all, 20)
                .frame(minWidth: 327, minHeight: 109, alignment: .leading)
                .shadow(radius: 50)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.75)]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                
                
            }
            .padding(.horizontal, 30)
   
        }
        .background(
            Image(obj.image)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        
    }
}
