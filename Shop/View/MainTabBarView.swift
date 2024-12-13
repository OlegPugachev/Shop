
import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            NavigationView {
                CatalogView()
            }
                .tabItem {
                VStack {
                    Image(systemName: "menucard")
                    Text("Сatalog")
                }
            }
            
            CartView(viewModel: CartViewModel()).tabItem {
                Image(systemName: "cart")
                Text("Cart")
            }
            
            ProfileView().tabItem {
                Image(systemName: "person.circle")
                Text("profile")
            }
        }
    }
}

#Preview {
    MainTabBarView()
}
