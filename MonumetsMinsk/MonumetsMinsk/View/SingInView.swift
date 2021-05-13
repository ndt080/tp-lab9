import SwiftUI
import Firebase

struct SingInView: View {
    @ObservedObject var settings = UserSettings()
    @State var email: String = ""
    @State var password: String = ""
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                let tmp = email.split(separator: "@")
                settings.userName = String(tmp[0])
                print("Success")
            }
        }
    }
    
    var body : some View{
        NavigationView{
                ScrollView(){
                    Spacer()
                    Text(Translation.signIn).fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text(Translation.titleEmail).font(.headline).fontWeight(.light).foregroundColor(Color.init(.label))
                            HStack{
                                TextField(Translation.placeholderEmail, text: $email)
                            }
                            Divider()
                            
                        }.padding(.bottom, 15)
                        
                        VStack(alignment: .leading){
                            Text(Translation.titlePass).font(.headline).fontWeight(.light).foregroundColor(Color.init(.label))
                            SecureField(Translation.placeholderPass, text: $password)
                            Divider()
                        }
                    }.padding(.horizontal, 6)
                    VStack{
                        Button(action: { login() }) {
                            Text(Translation.signIn).foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                        
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .padding(.top, 45)
                        
                        HStack(spacing: 8){
                            Text(Translation.queshionDontHaveAcc)
                            NavigationLink(destination: SingUpView()) {
                                Text(Translation.signUp).foregroundColor(.green)
                            }
                        }.padding(.top, 25)
                    }
                
            }.padding()
                .frame(minWidth: UIScreen.main.bounds.width, minHeight: 400, alignment: .center)
            .background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
        }
        .navigationBarHidden(true)
    }
    
}




struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView().environment(\.locale, .init(identifier: "en"))
    }
}
