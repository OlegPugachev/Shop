
import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Authorisation")
                .padding()
                .padding(.horizontal, 60)
                .font(.title2.bold())
                .background(.whiteAlpha)
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
                
                Button {
                    print("Login")
                } label: {
                    Text("Login")
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
                    print("Still Not With Us?")
                    
                    
                    
                    
                    AuthService.shared.signIn(with: self.email, password: self.password) { result in
                        switch result {
                                case .success:
                                print("Successfully logged in")
//                                self.presentationDetents.removeAll()
//                                self.presentationDetents.append(.destructive(Text("Logout"), action: {
//                                    AuthService.shared.signIn(email: self.email, password: self.password) { result in
//                                        switch result {
//                                                
//                                        }
//                                    }
//                                }
                                
                                case .failure(let error):
                                print("Error logging in: \(error)")
                                
                        }
                        
                    }
                    
                } label: {
                    Text("Still not with us?")
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
            .padding(20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background( Image("background").resizable().ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}

