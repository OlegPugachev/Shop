
import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented: Bool = false
    @State var isQuitAlertPresented: Bool = false
    @State var isAuthViewPresented: Bool = false
    
    @StateObject var viewModel: ProfileViewModel
    
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
                            dump("Library")
                        } label: {
                            Text ("Library")
                        }
                        
                        Button {
                            dump("Camera")
                        } label: {
                            Text("Camera")
                        }
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    TextField("Name", text: $viewModel.profile.name)
                        .font(.body.bold())
                    HStack {
                        Text("Phone:").bold()
                        TextField("Phone", value: $viewModel.profile.phone, format: IntegerFormatStyle.number)
                            .keyboardType(.phonePad)
                            //.mask(PhoneMask())
                    }
            }
            }.padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Leveransadress:").bold()
                TextField("Your address", text: $viewModel.profile.address)
            }.padding(.horizontal)
            
            
            //orders
            List {
                if viewModel.orders.count == 0 {
                    Text("Your orders")
                } else {
                    ForEach(viewModel.orders, id: \.id) { Order in
                        OrderCell(order: Order)
                        
                    }
                }
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
        .onSubmit {
            dump("On Submit")
            viewModel.setProfile()
        }
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
        
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(profile: UserModel(id: "rrrrr", name: "John Doe", phone: 80502828280, address: "Your address")))
}
