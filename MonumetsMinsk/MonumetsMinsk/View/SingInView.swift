import SwiftUI
import Firebase

struct SingInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                print("Success")
            }
        }
    }
    
    var body : some View{
        NavigationView{
            VStack {
                VStack(){
                    Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Email").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label))
                            HStack{
                                TextField("Enter Your Email", text: $email)
                            }
                            Divider()
                            
                        }.padding(.bottom, 15)
                        
                        VStack(alignment: .leading){
                            Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label))
                            SecureField("Enter Your Password", text: $password)
                            Divider()
                        }
                    }.padding(.horizontal, 6)
                    VStack{
                        Button(action: { login() }) {
                            Text("Sign In").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                        
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .padding(.top, 45)
                        
                        HStack(spacing: 8){
                            Text("Don't have an account ?")
                            NavigationLink(destination: SingUpView()) {
                                Text("Sign Up").foregroundColor(.green)
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




struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView()
    }
}
