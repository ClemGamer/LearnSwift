struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
    }
}
var square = Rect(origin: Point(),
    size: Size(width: 20.0, height: 20.0))
print(square.center)

square.center = Point(x: 60.0, y: 20.0)
print(square.origin)

// shorthand getter and setter
struct RectWithShortHand {
        var origin = Point()
    var size = Size()
    var center: Point {
        get {
            return Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
        }
        set {
            // use "newValue"
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
}

// read-only if a computed property if it has no setter
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    } // no setter, read-only
}

// willSet：在賦予值之前執行
// didSet：在賦予值完成後執行
// 如果有繼承關係,父類別的會先執行
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps