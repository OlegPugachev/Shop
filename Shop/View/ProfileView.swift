
import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented: Bool = false
    @State var isQuitAlertPresented: Bool = false
    @State var isAuthViewPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 16) {
                Image("profile").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding()
                    .background(.grayLight)
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Where can I get avatar?", isPresented: $isAvaAlertPresented) {
                        
                        Button {
                            print("Library")
                        } label: {
                            Text ("Library")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("Camera")
                        }
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Bjarne Stroustrup")
                        .bold()
                    Text("+1 234 567 890")
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Leveransadress:").bold()
                Text("Apt 14 Kaffevej 5 2610 Rødovre, H DNK")
            }.multilineTextAlignment(.leading)
            
            
            //orders
            List {
                Text("Your orders")
            }.listStyle(.plain)
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Quit")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }.padding()
                .confirmationDialog("You want out?", isPresented: $isQuitAlertPresented, titleVisibility: .visible) {
                    Button("Yes") {
                        isAuthViewPresented.toggle()
                    }
                }
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView() // stub
                }
        }
        
    }
}

#Preview {
    ProfileView()
}
