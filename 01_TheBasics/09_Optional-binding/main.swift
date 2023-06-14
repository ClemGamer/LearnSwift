// optional binding can be used with if and while statement to check for value inside an optional
let possibleNumber = "5"
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" can be converted to integer \(actualNumber)")
    // optional binding doesn't need to use "!" to silence compiler warning,
    // becuase the actualNumber is Int in this scope but Optional
    print("The type of actualNumber is", type(of:actualNumber))
} else {
    print("The string \"\(possibleNumber)\" could not be converted to integer")
}

let myNumber = Int(possibleNumber)
// define a constant in if scope
if let myNumber = myNumber {
    print(myNumber)
    print("The type of the shadow myNumber in if scope:", type(of:myNumber))
}
print("The type of myNumber out of the if scope:", type(of:myNumber))

// short
if let myNumber {
    print("The type of the shadow myNumber in if scope with shorten statement:", myNumber)
}

// define a constant
if let anotherName = myNumber {
    print("The value of another defined name in if scope:", anotherName)
    print("The type of another defined name in if scope:", type(of:anotherName)) // Int
    print("The type of myNumber in if scope:", type(of:myNumber)) // Optional<Int>
}

// multiple
// If any of the values in optional bindings are nil or any boolean condition are false,
// if statement's condition is false
if let firstNumber = Int("3"), let secondNumber = Int("30"), firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber) is \(firstNumber < secondNumber)")
}