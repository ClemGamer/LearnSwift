// continue
// start next loop immediatly

// break
// terminate loop immediatly

// fallthrough
// used in switch-case like other language

// return
// finish function and return value

// throw


// lable
// swift有像是組合語言的label
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")

// guard 用來判斷一個expression要是true或non nil
// guard 後面一定要接 else, 在判斷式為 false 或 nil 時執行
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "Clement"])
// Prints "Hello Clement!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Kaly", "location": "Taipei"])
// Prints "Hello Kaly!"
// Prints "I hope the weather is nice in Taipei."

// defer 用來讓函數在目前的block的最後執行
// 多個 defer 的狀況下, 後進先出
var score = 1
while score < 10 {
    defer {
        print(score) // defer 將 print(score) 放到 score+=4 後執行
    }
    score+=4
}
// 5, 9, 13

// API check
// swift 提供可以用來確認 API 版本的條件判斷
// @available
// #availible
// #unavailible
if #available(iOS 10, macOS 10.12, *) { // “*”是必要的,用來表示其他平台
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}

@available(macOS 10.12, *) // 表示ColorPreference只能在macOS 10.12以後的版本
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else { // 判斷執行階段的API版本
       return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}

if #unavailable(iOS 10) { // 只需要多寫向下相容的方法時,用#unavailible較容易閱讀
    // Fallback code
}