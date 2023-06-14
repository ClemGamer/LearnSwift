// throws keyword indicates that the function can throw an error
func canThrowAnError() throws {
    print("this function may or may not throw an error")
}

// use do...try...catch to catch error
do {
    try canThrowAnError()
} catch {

}

// catch different error conditions
// do {
//     try canThrowAnError()
// } catch SomeError.outDate {

// } catch SomeError.ranOut {

// }

