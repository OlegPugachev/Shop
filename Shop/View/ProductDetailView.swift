
import SwiftUI

struct ProductDetailView: View {
    
    @State var viewModel: ProductDetailViewModel
    @State var size =  memorySize.Gb256
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment: .leading){
            Image(uiImage: self.viewModel.image!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            HStack {
                Text("\(viewModel.product.title)")
                    .font(.title2.bold())
                Spacer()
                Text(String(format: "%.2f", size.getPrice(price: viewModel.product.price)) + " $")
                    .font(.title2)
            }.padding(.horizontal)
            
            Text(viewModel.product.description)
                .padding(.horizontal)
                .padding(.vertical, 4)
            
            HStack {
                Stepper("Count", value: $count ,in: 1...10)
                Text("\(self.count)").padding(.leading, 32)
            }.padding(.horizontal, 15)
            
            Picker("Size", selection: $size) {
                ForEach(memorySize.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.segmented).padding()
        }
        
        Button {
            var position = Position(id: UUID().uuidString,
                                    product: viewModel.product,
                                    count: self.count)
            
            position.product.price = size.getPrice(price: viewModel.product.price) * Double(self.count)
            
            CartViewModel.shared.addPosition(position)
            presentationMode.wrappedValue.dismiss()
            
        } label: {
            Text("Add to cart")
                .padding()
                .padding(.horizontal, 60)
                .background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                .padding(8)
                .padding(.horizontal, 12)
                .font(.title3.bold())
                .foregroundColor(.black)
        }
        .padding()
        .onAppear {
            self.viewModel.getImage()
        }
        Spacer()
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product:  Product(id: "1", title: "iPhone 16 Pro Max", imageUrl: "iphone16", price: 999, description: "Titanium design with larger 6.3-inch Super Retina XDR display, durable latest-generation Ceramic Shield, Action button, and USB-C with USB 3 speeds")))
}
