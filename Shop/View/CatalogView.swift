
import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2.4))]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("Popular") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { product in
                            NavigationLink {
                                ProductDetailView(product: product)
                            } label: {
                                ProductCell(product: product)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
            }
            
            Section("Products") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16) {
                        ForEach(CatalogViewModel.shared.products, id: \.id) { product in
                            NavigationLink {
                                ProductDetailView(product: product)
                            } label: {
                                ProductCell(product: product)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
            }
        }.navigationTitle(Text("Catalog"))
    }
}


#Preview {
    CatalogView()
}
