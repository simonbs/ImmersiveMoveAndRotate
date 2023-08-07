import RealityKit
import SwiftUI

struct ImmersiveRealityView: View {
    @State var object: InteractiveObject

    var body: some View {
        RealityView { content in
            let bounds = object.entity.model!.mesh.bounds.extents
            // Position the object 2 meters in front of the user
            // with the bottom of the object touching the floor.
            object.entity.position = SIMD3(0, bounds.y / 2, -2)
            content.add(object.entity)
        }
        .gesture(DragGesture()
            .targetedToEntity(object.entity)
            .onChanged { value in
                object.handleDragGesture(value)
            }
            .onEnded { _ in
                object.handleDragGestureEnded()
            }
        )
        .gesture(RotateGesture()
            .targetedToEntity(object.entity)
            .onChanged { value in
                object.handleRotationGesture(value)
            }
            .onEnded { _ in
                object.handleRotationGestureEnded()
            }
        )
    }
}
