# ImmersiveMoveAndRotate

Example project showing how an immersive scene on visionOS can contain a [RealityView](https://developer.apple.com/documentation/realitykit/realityview/) that presents a [ModelEntity](https://developer.apple.com/documentation/realitykit/modelentity) and how that entity can be dragged using [DragGesture](https://developer.apple.com/documentation/swiftui/draggesture) and rotated using [RotateGesture](https://developer.apple.com/documentation/SwiftUI/RotateGesture).

This example project deliberately only allows moving the object along the X- and Z-axis to prevent the user from lifting the object from the ground. However, it is straightforward to allow movement along the Y-axis by modifying the code in [InteractiveObject.swift](https://github.com/simonbs/ImmersiveMoveAndRotate/blob/main/ImmersiveMoveAndRotate/InteractiveObject.swift).

![](https://github.com/simonbs/ImmersiveMoveAndRotate/blob/main/video.gif?raw=true)
