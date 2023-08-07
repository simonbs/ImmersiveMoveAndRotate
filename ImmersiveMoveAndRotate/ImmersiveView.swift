import SwiftUI
import RealityKit

struct ImmersiveView: View {
    @State private var arcadeMachine: InteractiveObject?

    var body: some View {
        contentView
            .task {
                do {
                    arcadeMachine = try await InteractiveObject(named: "arcade_machine")
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
    }

    @ViewBuilder
    private var contentView: some View {
        if let arcadeMachine {
            ImmersiveRealityView(object: arcadeMachine)
        } else {
            ProgressView()
        }
    }
}
