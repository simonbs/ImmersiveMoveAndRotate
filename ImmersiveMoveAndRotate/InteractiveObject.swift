import RealityKit
import SwiftUI

struct InteractiveObject {
    let entity: ModelEntity

    private var sourcePosition: SIMD3<Float>?
    private var sourceRotation: simd_quatf?

    init(named name: String) async throws {
        entity = try await ModelEntity(named: name)
        let bounds = await entity.model!.mesh.bounds.extents
        await entity.components.set(CollisionComponent(shapes: [.generateBox(size: bounds)]))
        await entity.components.set(HoverEffectComponent())
        await entity.components.set(InputTargetComponent())
    }

    mutating func handleDragGesture(_ value: EntityTargetValue<DragGesture.Value>) {
        let sourcePosition = sourcePosition ?? entity.position
        self.sourcePosition = sourcePosition
        let delta = value.convert(value.translation3D, from: .local, to: entity.parent!)
        // Only allow the object to be moved along the X- and Z-axis.
        entity.position = sourcePosition + SIMD3(delta.x, 0, delta.z)
    }

    mutating func handleDragGestureEnded() {
        sourcePosition = nil
    }

    mutating func handleRotationGesture(_ value: EntityTargetValue<RotateGesture.Value>) {
        let sourceRotation = sourceRotation ?? entity.transform.rotation
        self.sourceRotation = sourceRotation
        let delta = simd_quatf(angle: Float(value.rotation.radians), axis: [0, 1, 0])
        entity.transform.rotation = sourceRotation * delta
    }

    mutating func handleRotationGestureEnded() {
        sourceRotation = nil
    }
}
