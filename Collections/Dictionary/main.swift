// generic
// no ordering

// create an empty dictionary
var namesOfIntegers: [Int: String] = [:]

// add element to a dictionary
namesOfIntegers[16] = "sixteen"

// create a dictionary with a dictionay literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// shorten
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// 從dictionary用key拿值會回傳Optional, 因為可能不存在
print("access value with key", "\"DUB\"")
if let airportName = airports["DUB"] {
    print(airportName)
}

// 用updateValue函數更改dictionary內容會回傳舊的值的Optional, 因為可能不存在
// 若更改的key不存在, 則會當作新增一筆key value
print("update value with key", "\"NO\"")
if let oldValue = airports.updateValue("some value", forKey: "NO") {
    print(oldValue)
} else {
    print("key not exist")
    // key "NO" 不存在, 所以增加進 airports
}

airports["APL"] = "Apple International"
// remove by assign nil to a key
airports["APL"] = nil
// remove by removeValue
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("removed value", removedValue)
}

// iterating over a dictionary
print("iterating over a dictionary")
for (key, value) in airports {
    print("\(key) : \(value)")
}
print("iterating over a dictionary's keys")
for key in airports.keys {
    print("key: \(key)")
}
print("iterating over a dictionary's values")
for value in airports.values {
    print("value: \(value)")
}

print("initialize an array with the keys or values of a dictionary")
let keys = [String](airports.keys) // can use .sorted()
print(keys)
let values = [String](airports.values) // can use .sorted()
print(values)