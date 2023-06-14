
let possibleString: String? = "An optional string"
let forcedString: String = possibleString! // required "!"

let assumedString: String! = "An implicity unwrapped optional string"
let implicitString: String = assumedString // no required "!"

// It will cause runtime error if a implicitly unwrapped optional contains nil
// let errorString: String! = nil
// let runtimeErrorQQ: String = errorString