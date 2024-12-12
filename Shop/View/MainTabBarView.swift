
import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            CatalogView().tabItem {
                VStack {
                    Image(systemName: "menucard")
                    Text("Сatalog")
                }
            }
            
            CartView().tabItem {
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
