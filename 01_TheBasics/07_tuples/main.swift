// Tuples group multiple values into a single compound value.
// The values within a tuple can be of any type.
let httpResponse = (200, "Hello")
print("httpResponse", type(of:httpResponse), httpResponse) // (Int, String) (200, "Hello")

// decompose a tuple
let (statusCode, statusMessage) = httpResponse
print("status code:", statusCode)
print("status message:", statusMessage)

// use "_" to ignore value
let (iWantThis, _) = httpResponse
print("I just want this:", iWantThis)

// use index to access values in a tuple
print("The first element:", httpResponse.0)
print("The second element:", httpResponse.1)

// or named the values in a tuple and access them by name
let httpError = (statusCode: 404, statusMessage: "Not Found")
print("The status code:", httpError.statusCode)
print("The status message:", httpError.statusMessage)