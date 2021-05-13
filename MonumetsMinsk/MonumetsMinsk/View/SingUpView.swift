import SwiftUI
import Firebase

struct SingUpView: View {
    @State var email: String = ""
    @State var pass: String = ""
    @State var name: String = ""
    @State var agreeCheck: Bool = false

    func registration() {
        Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                print("Success reg")
            }
        }
    }
    
    var body : some View{
        NavigationView{
                ScrollView(){
                    Spacer()
                    Text(Translation.signUp).fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
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
                            SecureField(Translation.placeholderPass, text: $pass)
                            Divider()
                        }
                        
                        VStack(alignment: .leading){
                            Text(Translation.titleName).font(.headline).fontWeight(.light).foregroundColor(Color.init(.label))
                            HStack{
                                TextField(Translation.placeholderName, text: $name)
                            }
                            Divider()
                            
                        }.padding(.bottom, 15)
                        
                        
                    }.padding(.horizontal, 6)
                    VStack{
                        Toggle(isOn: $agreeCheck)
                        {
                            Text(Translation.terms).font(.caption)
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                        .padding(.top, 45)
                        
                        Button(action: { registration() }) {
                            Text(Translation.signUp).foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                        }
                        .disabled(!agreeCheck)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .padding(.top, 45)
                        
                        
                        HStack(spacing: 8){
                            Text(Translation.queshionHaveAcc)
                            NavigationLink(destination: SingInView()) {
                                Text(Translation.signIn).foregroundColor(.green)
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





struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView().environment(\.locale, .init(identifier: "en"))
    }
}
