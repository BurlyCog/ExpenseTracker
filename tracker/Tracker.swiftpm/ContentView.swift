import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userProfile: UserProfile
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            MainTabView(isLoggedIn: $isLoggedIn)
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserProfile())
}
