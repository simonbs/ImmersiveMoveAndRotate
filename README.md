# ImmersiveMoveAndRotate

Example project showing how an immersive scene on visionOS can contain a [RealityView](https://developer.apple.com/documentation/realitykit/realityview/) that presents a [ModelEntity](https://developer.apple.com/documentation/realitykit/modelentity) and how that entity can be dragged using [DragGesture](https://developer.apple.com/documentation/swiftui/draggesture) and rotated using [RotateGesture3D](https://developer.apple.com/documentation/swiftui/rotategesture3d).

This example project deliberately only allows moving the object along the X- and Z-axis to prevent the user from lifting the object from the ground. However, it is straightforward to allow movement along the Y-axis by modifying the code in [EntityMovementViewModifier.swift](https://github.com/simonbs/ImmersiveMoveAndRotate/blob/main/ImmersiveMoveAndRotate/EntityMovementViewModifier.swift).

**Note:** Performing 3D gestures in the simulator is difficult because the simulated gestures are actually performed on a 2D surface. Based on my testing, it appears that the axis around which the gesture rotates depends on the side of the object we are touching and/or the side of the object we are looking at. I expect this to work better on a device.

![](https://github.com/simonbs/ImmersiveMoveAndRotate/blob/main/video.gif?raw=true)
