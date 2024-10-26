# Swift Haptics [![Swift](https://github.com/jochenbernard/swift-haptics/actions/workflows/swift.yml/badge.svg)](https://github.com/jochenbernard/swift-haptics/actions/workflows/swift.yml)

Documentation is still a few coffees away from being here...

In the meantime... this is what you can do with it:

```Swift
Button("Trigger") {
    trigger.toggle()
}
.haptics(trigger: trigger) {
    SomeCustomHapticPattern()
        .speed(2.0)
        .delay(0.5)

    HapticPatternGroup {
        for offset in 0..<5 {
            TransientHapticEvent(
                time: 1.5,
                intensity: 1.0
            )
            .delay(0.1 * TimeInterval(offset))
        }

        if includeBuzz {
            ContinuousHapticEvent(
                time: 2.0,
                duration: 0.5,
                sharpness: 0.5
            )
        }
    }
    .scale(sharpness: customSharpnessScale)

    ErrorHapticPattern()
        .delay(2.5)
        .muted(!makeDrama)
}
```
