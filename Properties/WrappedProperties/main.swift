// property wrapper
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
var twelveOrLess = TwelveOrLess()
twelveOrLess.wrappedValue = 15
print(twelveOrLess.wrappedValue)
// 12

// use property wrapper to define properties
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}
var rectangle = SmallRectangle()
rectangle.height = 15
print(rectangle.height)
// 12

// 設定wrapper的初始化
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
    // 沒有給參數的預設值
    init() {
        maximum = 12
        number = 0
    }
    // 用參數設定
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}
var narrowRect = NarrowRectangle()
print(narrowRect.height, narrowRect.width)
narrowRect.height = 50
narrowRect.width = 50
print(narrowRect.height, narrowRect.width)

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 10) var width: Int = 2
}
var mixedRect = MixedRectangle()
print(mixedRect.height, mixedRect.width)
// 1 2
mixedRect.height = 20
mixedRect.width = 20
print(mixedRect.height, mixedRect.width)
// 12 10
