// type followed by a question mark
// the question mark indicates that the value it contains is optional, might be Int or nil
let statusCode: Int? = 404
print(statusCode)

// define an optional variable without providing a default value, the variable is automatically set to nil
var statusMessage: String?
print(statusMessage)

// text might be converted failed when text is "Hello", so the conversion will be Optional
let text = "123"
let convertedText = Int(text)
if convertedText != nil {
    print(convertedText!) // use "!" when you ensure the optional contains a value
}