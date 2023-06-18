// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations
// 多行
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 單行要加","分隔
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var direction = CompassPoint.north
direction = .east // 已經給過enum值的,因為type已經固定,可以用簡化的語法給予同個enum的值

// enum用在switch-case
switch direction {
case .north:
    print("north")
case .east:
    print("east")
default:
    print("default")
}

// 在enum後面接(: CaseIterable)可以讓enum的allCases作為collection使用
// CaseIterable是Protocal
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

// enum可以賦予不同型態的值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var barcode = Barcode.upc(2, 24124, 34344, 3)
print(barcode)
switch barcode {
    case .upc(let a, let b, let c, let d):
        print(a, b, c, d)
    case .qrCode(let code):
        print(code)
}
barcode = .qrCode("ASBJSDKASJDLSK")
print(barcode)
// shorten
switch barcode {
    case let .upc(a, b, c, d):
        print(a, b, c, d)
    case let .qrCode(code):
        print(code)
}

// Raw Value
// 在enum後面接type
enum CompassPointWithRawValue: String {
    case north, west, east, south
}
print(CompassPointWithRawValue.north.rawValue)
// north

enum PlanetWithRawValue: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune // 遞增
}
print(PlanetWithRawValue.earth.rawValue)
// 3

// 賦予Raw Value
enum ASCIIChars: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
print(ASCIIChars.lineFeed.rawValue)

// assign by raw value
// 因為用Raw Value賦予值,可能會找不到對應Raw Value的key,所以會是Optional Type
let possiblePlanet = PlanetWithRawValue(rawValue: 7)
print(type(of: possiblePlanet))
if let planet = PlanetWithRawValue(rawValue: 6) {
    print(planet)
} else {
    print("not found in Planet")
}

// recursive enumerations
// key word: indirect
// enum ArithmeticExpression {
//     case number(Int)
//     indirect case addition(ArithmeticExpression, ArithmeticExpression)
//     indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
// }
// 如果enum內都是indirect,indirect直接接在enum前
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
// Prints "18"