
import SwiftUI

struct MainTabBarView: View {
    
    var viewModel: MainTabBarViewModel 
    
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
            
            CartView(viewModel: CartViewModel.shared).tabItem {
                VStack {
                    Image(systemName: "cart")
                    Text("Cart")
                }
            }
            
            ProfileView().tabItem {
                VStack {
                    Image(systemName: "person.circle")
                    Text("profile")
                }
            }
        }
    }
}

//#Preview {
//    MainTabBarView()
//}
