import SwiftUI
import RealityKit

struct ImmersiveView: View {
    @State private var entity: ModelEntity?

    var body: some View {
        contentView
            .task {
                do {
                    entity = try await ModelEntity.loadArcadeMachine()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
    }

    @ViewBuilder
    private var contentView: some View {
        if let entity {
            RealityView { content in
                let bounds = entity.model!.mesh.bounds.extents
                // Position the object 2 meters in front of the user
                // with the bottom of the object touching the floor.
                entity.position = SIMD3(0, bounds.y / 2, -2)
                content.add(entity)
            }
            .enableMovingEntity(entity)
        } else {
            ProgressView()
        }
    }
}

private extension ModelEntity {
    static func loadArcadeMachine() async throws -> ModelEntity {
        let entity = try await ModelEntity(named: "arcade_machine")
        let bounds =  entity.model!.mesh.bounds.extents
        entity.components.set(CollisionComponent(shapes: [.generateBox(size: bounds)]))
        entity.components.set(HoverEffectComponent())
        entity.components.set(InputTargetComponent())
        return entity
    }
}
