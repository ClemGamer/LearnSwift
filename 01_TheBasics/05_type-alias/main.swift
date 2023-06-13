typealias AnotherName = UInt16
print(AnotherName.min, AnotherName.max)

let one: UInt16 = 1
let two: AnotherName = 2
print(one + two)

let three: UInt32 = 3
// let five = two + three // error '+' cannot be applied to UInt32 and AnotherName (aka Uint16)