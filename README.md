# SwiftHaptics [![Swift](https://github.com/jochenbernard/swift-haptics/actions/workflows/swift.yml/badge.svg)](https://github.com/jochenbernard/swift-haptics/actions/workflows/swift.yml)

SwiftHaptics is a cross-platform Swift package to provide advanced haptics using
a simple yet powerful API.

## Installation

Add `https://github.com/jochenbernard/swift-haptics` to your project using Swift
Package Manager.

## Usage

### Playing Basic Haptic Patterns

Haptic patterns can easily be triggered from your SwiftUI views using the
`haptics` view modifier. You can provide `haptics` with an `Equatable` trigger
and a `HapticPattern` or a `HapticPatternBuilder`. The haptic pattern will be
played when the provided trigger value changes.

```Swift
var body: some View {
    someView
        .haptics(trigger: trigger) {
            TransientHapticEvent(time: 0.0)

            ContinuousHapticEvent(
                time: 0.5,
                duration: 0.5
            )
        }
}
```

### Creating Advanced Haptic Patterns

SwiftHaptics provides two basic haptic events which are the building blocks to
create haptic patterns: `TransientHapticEvent` and `ContinuousHapticEvent`.
Transient events are brief impulses while continuous events are looped waveforms
of arbitrary length.

Using these two basic haptic events you can create custom, more advanced, haptic
patterns by conforming to the `HapticPattern` protocol. A `HapticPattern` has to
define a `pattern` property, which is a `HapticPatternBuilder`, to provide its
underlying pattern. These builders also support `if` statements, `switch`
statements and `for` loops.

```Swift
struct MyHapticPattern: HapticPattern {
    var pattern: HapticPattern {
        TransientHapticEvent(time: 0.0)

        ContinuousHapticEvent(
            time: 0.5,
            duration: 0.5
        )
    }
}
```

### Modifying Haptic Patterns

Haptic patterns also support modifiers.

- `scale` allows you to scale a haptic pattern's intensity and sharpness.
- `speed` allows you to speed up or slow down a haptic pattern.
- `delay` allows you to delay a haptic pattern.
- `muted` allows you to conditionally mute a haptic pattern.

```Swift
var body: some View {
    someView
        .haptics(trigger: trigger) {
            MyHapticPattern()
                .scale(
                    intensity: 0.5,
                    sharpness: 2.0
                )
                .speed(2.0)
                .delay(1.0)
                .muted(!playHaptics)
        }
}
```

### Creating Custom Haptic Pattern Modifiers

You can also implement custom haptic pattern modifiers by conforming to the
`HapticPatternModifier` protocol. A `HapticPatternModifier` has to define a
`pattern` function, which is a `HapticPatternBuilder`, that receives the
original `HapticPattern` and returns the modified `HapticPattern`.

To apply a `HapticPatternModifier` to a `HapticPattern` use the `modifier`
function.

```Swift
struct MyHapticPatternModifier: HapticPatternModifier {
    func pattern(pattern: HapticPattern) -> HapticPattern {
        pattern
            .scale(
                intensity: 2.0,
                sharpness: 2.0
            )
            .speed(2.0)
    }
}

extension HapticPattern {
    func myModifier() -> HapticPattern {
        modifier(MyHapticPatternModifier())
    }
}
```

Next, the custom modifier can be used as follows:

```Swift
MyHapticPattern()
    .myModifier()
```

### Playing Haptic Patterns Outside Of SwiftUI

SwiftHaptics can also be used outside of SwiftUI by creating a `HapticEngine`
instance and using its `play` method. You can
provide `play` with either a `HapticPattern` or a `HapticPatternBuilder`.

```Swift
let hapticEngine = HapticEngine()
hapticEngine.play {
    TransientHapticEvent(time: 0.0)

    ContinuousHapticEvent(
        time: 0.5,
        duration: 0.5
    )
}
```
