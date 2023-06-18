struct AudioChannel {
     // static與所有AudioChannel共用
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
print(AudioChannel.maxInputLevelForAllChannels)
// 0
leftChannel.currentLevel = 5
print(leftChannel.currentLevel)
// 5
print(AudioChannel.maxInputLevelForAllChannels)
// 5
rightChannel.currentLevel = 12
print(rightChannel.currentLevel)
// 10
print(AudioChannel.maxInputLevelForAllChannels)
// 10