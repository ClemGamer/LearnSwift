// assert will terminate program when the condition is false
var age = -3
assert(age >= 0, "A person's age can not be less than zero.")

// same
var age = -3
if age > 0 {

} else {
    assertionFailure("A person's age can not be less than zero.")
}