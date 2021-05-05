import SwiftUI
import MapKit

struct RouteFormView: View {
    @Binding var isActive: Bool
    @Binding var routeAnnotation: [MKAnnotation]
    @Binding var selectedAnnotation: MKAnnotation?
    @State var to: String = ""
    @State var from: String = ""
    @State var toRoute: MKAnnotation?
    @State var fromRoute: MKAnnotation?
    @State var tmpRouteAnnotation: [MKAnnotation] = []
    
    func createRoute(type: String){
        if type == "From" &&  !selectedAnnotation!.isEqual(toRoute) {
            self.fromRoute = self.selectedAnnotation
            if(tmpRouteAnnotation.count == 0){
                self.tmpRouteAnnotation.append(self.selectedAnnotation!)
            } else {
                self.tmpRouteAnnotation[0] = self.selectedAnnotation!
                
            }
        }
        if type == "To" &&  !selectedAnnotation!.isEqual(fromRoute) {
            self.toRoute = self.selectedAnnotation
            if(tmpRouteAnnotation.count < 2){
                self.tmpRouteAnnotation.append(self.selectedAnnotation!)
            } else {
                self.tmpRouteAnnotation[1] = self.selectedAnnotation!
            }
        }
    }
    
    func setRoute(){
        self.routeAnnotation = self.tmpRouteAnnotation
        self.isActive = false
    }
    
    var body: some View {
        
        ZStack() {
            VStack(alignment: .center, spacing: 16) {
                VStack(){
                    HStack{
                        Button("From") {
                            createRoute(type: "From")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: 5)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)))
                        .cornerRadius(20)
                        Button("To") {
                            createRoute(type: "To")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: 5)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)))
                        .cornerRadius(20)
                        
                    }
                    .padding(.bottom, 15)
                    .pickerStyle(SegmentedPickerStyle())
                    HStack{
                        Text("From: ")
                        TextField(((fromRoute?.title) ?? "from")!, text: $from).disabled(true)
                    }
                    HStack{
                        Text("To: ")
                        TextField(((toRoute?.title) ?? "to")!, text: $to).disabled(true)
                    }
                }
                .padding(.horizontal, 30)
                
                Button(action: {
                    setRoute()
                }) {
                    Text("Select route")
                        .foregroundColor(.white)
                        .frame(width: 250, height: 44)
                        .background(Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)))
                        .cornerRadius(20)
                        .shadow(color: Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)).opacity(0.6), radius: 10, y: 10)
                        .padding(.bottom, 30)
                    
                }
                
            }
            .frame(width: 300, height: 250, alignment: .bottom)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: "xmark")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .offset(x: 160, y: 35)
                    .onTapGesture {
                        self.isActive = false
                    }
                
            }.padding(.trailing, 80)
            .padding(.top, -15)
            .frame(width: 300, height: 250, alignment: .top)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-150, alignment: .bottom)
        
    }
}


struct RouteFormView_Previews: PreviewProvider {
    static var previews: some View {
        let obj = LandmarkAnnotation(title: "Национальный аэропорт Минск",
                                     subtitle:"Тупо аэропорт",
                                     coordinate: .init(latitude: 53.890632, longitude: 28.033768))
        RouteFormView(isActive: .constant(true),
                      routeAnnotation: .constant([]),
                      selectedAnnotation: .constant(obj))
    }
}
