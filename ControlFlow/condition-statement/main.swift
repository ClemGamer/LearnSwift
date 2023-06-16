// if
var temperatureInCelsius = 30
if temperatureInCelsius < 32 {
    print("\(temperatureInCelsius) is less than 32")
}

if temperatureInCelsius > 32 {
    print("\(temperatureInCelsius) is greater than 32")
} else {
    print("\(temperatureInCelsius) is less than 32")
}

if temperatureInCelsius > 40 {
    print("\(temperatureInCelsius) is greater than 40")
} else if temperatureInCelsius > 30 {
    print("\(temperatureInCelsius) is greater than 30")
} else {
    print("\(temperatureInCelsius) is less than 30")
}

// switch is auto break
let someCharacter: Character = "z"
switch someCharacter {
    case "a":
        print("first")
    case "z":
        print("second")
    default:
        print("default")
}

switch someCharacter {
    case "a": // error, swift不能用空的case
    case "A":
        print("first")
    case "z":
        print("second")
    default:
        print("default")
}

switch someCharacter {
    case "a", "A": // 要合在一起
        print("first")
    case "z":
        print("second")
    default:
        print("default")
}

// tuples也可以當作條件
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"

// value binding,可以將值賦予到條件裡使用
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0): // anotherPoint[1]值為0時,let x = anotherPoint[0]
    print("on the x-axis with an x value of \(x)")
case (0, let y): // anotherPoint[0]值為0時,let y = anotherPoint[1]
    print("on the y-axis with a y value of \(y)")
case let (x, y): // 其他,let x = anotherPoint[0];let y = anotherPoint[1]
    print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"

// value binding也可以做through
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance): // stillAnotherPoint[0]或stillAnotherPoint[1]為0
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin"

// where, 像是SQL語句的用法
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"