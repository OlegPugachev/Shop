
import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "iphone15")!
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var price: Int? = nil
    
    var body: some View {
        VStack {
            Text("Add product")
                .font(.title2.bold())
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(24)
                .onTapGesture {
                    showImagePicker.toggle()
                }
            
            TextField("Product title", text: $title)
                .padding()
            TextField("Product price", value: $price, format: .number)
                .keyboardType(.numberPad)
                .padding()
            TextField("Product description", text: $description)
                .padding()
            
            Button {
                dump("Save product")
            } label: {
                Text("Save product")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

#Preview {
    AddProductView()
}
