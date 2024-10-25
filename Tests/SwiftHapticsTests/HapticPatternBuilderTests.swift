import Testing

@testable import SwiftHaptics

struct HapticPatternBuilderTests {
    @Test
    func buildArray() {
        @HapticPatternBuilder
        var hapticPatternBuilder: HapticPattern {
            for _ in 0..<4 {
                MockHapticEvent.mock
            }
        }

        let hapticPattern = hapticPatternBuilder as! HapticPatternList
        let patterns = hapticPattern.patterns.map {
            $0 as! MockHapticEvent
        }
        let expectedPatterns = [
            MockHapticEvent.mock,
            MockHapticEvent.mock,
            MockHapticEvent.mock,
            MockHapticEvent.mock
        ]

        #expect(patterns == expectedPatterns)
    }

    @Test
    func buildOptional() {
        @HapticPatternBuilder
        var hapticPatternBuilder: HapticPattern {
            if true {
                MockHapticEvent.mock
            }

            if false {
                MockHapticEvent.mock
            }
        }

        let hapticPattern = hapticPatternBuilder as! HapticPatternList
        let patterns = hapticPattern.patterns

        #expect(patterns.count == 2)

        let firstPattern = patterns[0] as! MockHapticEvent
        let secondPattern = patterns[1]

        #expect(firstPattern == MockHapticEvent.mock)
        #expect(type(of: secondPattern) == EmptyHapticPattern.self)
    }

    @Test
    func buildEither() {
        @HapticPatternBuilder
        var hapticPatternBuilder: HapticPattern {
            if true {
                MockHapticEvent.mock
            } else {
                MockHapticEvent.mock
            }

            if false {
                MockHapticEvent.mock
            } else {
                MockHapticEvent.mock
            }
        }

        let hapticPattern = hapticPatternBuilder as! HapticPatternList
        let patterns = hapticPattern.patterns.map {
            $0 as! MockHapticEvent
        }
        let expectedPatterns = [
            MockHapticEvent.mock,
            MockHapticEvent.mock
        ]

        #expect(patterns == expectedPatterns)
    }

    @Test
    func buildBlock() {
        @HapticPatternBuilder
        var hapticPatternBuilder: HapticPattern {
            MockHapticEvent.mock

            MockHapticEvent.mock

            MockHapticEvent.mock

            MockHapticEvent.mock
        }

        let hapticPattern = hapticPatternBuilder as! HapticPatternList
        let patterns = hapticPattern.patterns.map {
            $0 as! MockHapticEvent
        }
        let expectedPatterns = [
            MockHapticEvent.mock,
            MockHapticEvent.mock,
            MockHapticEvent.mock,
            MockHapticEvent.mock
        ]

        #expect(patterns == expectedPatterns)
    }
}
