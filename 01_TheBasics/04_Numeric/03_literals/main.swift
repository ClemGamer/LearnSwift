// decimal
let decimalInteger = 30
print(decimalInteger)

// binary
let binaryInteger = 0b11110
print(binaryInteger, Int(binaryInteger))

// octal
let octalInteger = 0o36
print(octalInteger, Int(octalInteger))

// hexadecimal
let hexadecimalInteger = 0x1e
print(hexadecimalInteger, Int(hexadecimalInteger))

// exponent
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xc.3p0
print(decimalDouble, exponentDouble, hexadecimalDouble)

// easy to read format
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let overOneMillionDouble = 1_000_000.000_1
print(paddedDouble, oneMillion, overOneMillionDouble)