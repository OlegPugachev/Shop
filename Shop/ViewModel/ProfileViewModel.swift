
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: UserModel
    
    init(profile: UserModel) {
        self.profile = profile
    }
    
    func setProfile() {
        DataBaseService.shared.setProfile(user: self.profile) { result in
            switch result {
                    
                case .success(let user):
                    dump("setProfile \( user.name)")
                case .failure(let error):
                    dump("setProfile method error: \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DataBaseService.shared.getProfile { result in
            switch result {
                case .success(let user):
                    self.profile = user
                    dump("getProfile \( user.name)")
                case .failure(let error):
                    dump("getProfile method error: \(error.localizedDescription)")
            }
        }
    }
}
