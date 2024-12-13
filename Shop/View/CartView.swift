
import SwiftUI

struct CartView: View {
    
    var viewModel: CartViewModel
   
    var body: some View {
        Text("CartView")
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}
