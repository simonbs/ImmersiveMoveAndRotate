import SwiftUI
import RealityKit

struct ContentView: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        VStack {
            Button {
                Task {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                    dismissWindow()
                }
            } label: {
                Text("Show Arcade Machine")
            }
        }
        .padding()
    }
}
