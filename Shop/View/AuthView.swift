
import SwiftUI

struct AuthView: View {
    
    @State private var isAuth: Bool = true
    
    @State private var email = "test@test.com"
    @State private var password = "123456789"
    @State private var confirmPassword = "123456789"
    @State private var isTabViewShow = false
    
    @State private var isShowAlert: Bool = false
    @State private var alertMessage: String = ""
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isAuth ? "Authorisation" : "Registration")
                .padding(12 )
            //.padding(isAuth ? 16 : 24)
                .padding()
                .padding(.horizontal, 60)
                .font(.title2.bold())
                .background(.whiteAlpha)
            //.cornerRadius(isAuth ? 30 : 12)
                .cornerRadius(12)
            
            VStack {
                TextField("Email", text: $email)
                    .padding()
                    .background(.whiteAlpha)
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(.whiteAlpha)
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                if !isAuth {
                    SecureField("Confirm password", text: $confirmPassword)
                        .padding()
                        .background(.whiteAlpha)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        dump("Authorisation through Firebase")
                        AuthService.shared.signIn(email: self.email, password: self.password) { result in
                            switch result {
                                case .success(_):
                                    dump("Authorisation successful")
                                    isTabViewShow.toggle()
                                case .failure(let error):
                                    dump("Error: \(error)")
                                    alertMessage = "Error authorisation: \(error.localizedDescription)"
                                    isShowAlert.toggle()
                            }
                        }
                    } else {
                        dump("Registration")
                        guard password == confirmPassword else {
                            self.alertMessage = "Passwords don't match"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.signUp(email: email, password: password) { result in
                            
                            switch result {
                                case .success(let user):
                                    dump("Successfully logged in")
                                    alertMessage = "User \(user.email!) created successfully"
                                    self.isShowAlert.toggle()
                                    
                                    self.email = ""
                                    self.password = ""
                                    self.confirmPassword = ""
                                    self.isAuth.toggle()
                                    
                                case .failure(let error):
                                    dump("Error logging in: \(error)")
                                    alertMessage = "Error creating user: \(error.localizedDescription)"
                                    self.isShowAlert.toggle()
                            }
                        }
                    }
                } label: {
                    Text(isAuth ? "Login" : "Create Account")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.black)
                }
                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Still not with us?" : "Have an account.")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .padding(.top, 20)
            .background(.whiteAlpha)
            .cornerRadius(20)
            .padding(12)
            .alert(alertMessage, isPresented: $isShowAlert){
                Button { } label: {
                    Text("OK")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: isAuth ? 0 : 5)
        )
        .animation(Animation.easeInOut(duration: 0.3), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow) {
            
            let mainTabBarView = MainTabBarViewModel(user: AuthService.shared.currentUser!)
            MainTabBarView(viewModel: mainTabBarView)
        }
    }
}

#Preview {
    AuthView()
}

