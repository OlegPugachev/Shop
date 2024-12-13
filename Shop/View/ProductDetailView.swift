
import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var size =  memorySize.Gb256
    @State var count = 1
    
    var body: some View {
        
        VStack(alignment: .leading){
            Image("iPhone16")
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
            print("add to cart")
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
        }.padding()
        Spacer()
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product:  Product(id: "1", title: "iPhone 16 Pro Max", imageUrl: "Not found", price: 999, description: "Titanium design with larger 6.3-inch Super Retina XDR display, durable latest-generation Ceramic Shield, Action button, and USB-C with USB 3 speeds")))
}
