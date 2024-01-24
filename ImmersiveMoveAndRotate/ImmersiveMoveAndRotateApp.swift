import SwiftUI

@main
struct ImmersiveMoveAndRotateApp: App {
    var body: some Scene {
        ImmersiveSpace {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}
