import SwiftUI

@main
struct ImmersiveMoveAndRotateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}
