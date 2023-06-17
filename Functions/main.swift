// swift的回傳型態用"->"
func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}
// swift函數的參數需要指定參數名稱,不然會compile error
print(greet(person: "Clement"))
print(greet(person: "John"))

// 有回傳值的函數一定要用變數接收或使用,否則會compile warning
// 如果不需要回傳值,可以用"_"忽略
let _ = greet(person: "Navy")

// 多個回傳值為Tuple型態
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (min: currentMin, max: currentMax)
}
print(minMax(array: [4,1,9,5,7,8,8,5,3]))

func minMaxOptional(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMaxOptional(array: []) {
    print(bounds)
}

// implicilty return
// 如果有回傳值的函數內只有一個expression
// 那expression會被隱含作為回傳值
func greeting2(person: String) -> String {
    "Hello \(person)!"
}
print(greeting2(person: "Lara"))

// parameter label
// 在參數前加label,在呼叫函數時,要用label作為參數名
// 主要是可以提高易讀性
func sayHello(to person: String) -> String {
    "Hello, \(person)!!!"
}
print(sayHello(to: "Shown"))

// "_"忽略參數名,呼叫函數時,被忽略的參數不用參數名,以位置區分
func foo(_ x: Int, _ y: Int) {
    print(x, y)
}
foo(1, 2)

// variadic
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count) // variadic parameter is constant array type
}

// in-out is pass by reference
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var a = 5
var b = 20
swapTwoInts(&a, &b) // 宣告inout的參數要傳入變數記憶體位置
print(a, b)

// Function Type
var mathFunction: (inout Int, inout Int) -> () = swapTwoInts
mathFunction(&a, &b)
print(a, b)

// Function Type as parameter
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = mathFunction(a, b)
    print(result)
}
// use anonymous function as a parameter
printMathResult({(_ a: Int, _ b: Int) -> Int in
    a + b
},1 , 2)

// return Function Type
func plusOne(_ input: Int) -> Int {
    input + 1
}
func subOne(_ input: Int) -> Int {
    input - 1
}
func chooseFunction(sub: Bool) -> (Int) -> Int {
    sub ? subOne : plusOne
}
var n = 5
let moveNearerToZero = chooseFunction(sub: n > 0)
while n != 0 {
    print("current value:", n)
    n = moveNearerToZero(n)
}

// Nested Function
func chooseFooOrBar(chooseFoo: Bool) -> () -> () {
    func foo() {
        print("foo")
    }
    func bar() {
        print("bar")
    }
    return chooseFoo ? foo : bar
}
let doSomthing = chooseFooOrBar(chooseFoo: true)
doSomthing()