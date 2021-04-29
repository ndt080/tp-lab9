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
            VStack {
                VStack(){
                    Text("Sing Up").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Email").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label))
                            HStack{
                                TextField("Enter Your Email", text: $email)
                                if email != "" {
                                    Image("check").foregroundColor(Color.init(.label))
                                }
                            }
                            Divider()
                            
                        }.padding(.bottom, 15)
                        
                        VStack(alignment: .leading){
                            Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label))
                            SecureField("Enter Your Password", text: $pass)
                            Divider()
                        }
                        
                        VStack(alignment: .leading){
                            Text("Name").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label))
                            HStack{
                                TextField("Enter Your Name", text: $name)
                                if email != "" {
                                    Image("check").foregroundColor(Color.init(.label))
                                }
                            }
                            Divider()
                            
                        }.padding(.bottom, 15)
                        
                        
                    }.padding(.horizontal, 6)
                    VStack{
                        Toggle(isOn: $agreeCheck)
                        {
                            Text("Agree to the Terms and Conditions and Privacy Policy of NLogger").font(.caption)
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                        .padding(.top, 45)
                        
                        Button(action: { registration() }) {
                            Text("Sign Up").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                        }
                        .disabled(!agreeCheck)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .padding(.top, 45)
                        
                        
                        HStack(spacing: 8){
                            Text("Do you have an account?")
                            NavigationLink(destination: SingInView()) {
                                Text("Sign in").foregroundColor(.green)
                            }
                        }.padding(.top, 25)
                    }
                }.padding()
                
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
        }
        .navigationBarHidden(true)
    }
}




struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
