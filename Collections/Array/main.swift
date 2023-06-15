// generic collection

// create empty array
var someInts: [Int] = []

// create an array with default value
var threeDoubles = Array(repeating: 0.0, count: 3) // equals [0.0, 0.0, 0.0]

// create with values
var shopingList: [String] = ["Milk", "Eggs"]

// create with multiple array
var twoDoubles = [1.0, 2.0]
var comdineDoubles = threeDoubles + twoDoubles // [0.0, 0.0, 0.0, 1.0, 2.0]

// add element to array
twoDoubles += [3.0, 3.0] // [1.0, 2.0, 3.0, 3.0]
twoDoubles.append(4.0) // [1.0, 2.0, 3.0, 3.0, 4.0]

// modify array
twoDoubles[3] = 5.0 // [1.0, 2.0, 3.0, 5.0, 4.0]
twoDoubles[1...3] = [0.0, 0.0] // [1.0, 0.0, 0.0, 4.0], 指定了三個位置，但只給兩個值，會把多餘的位置抽掉
print(twoDoubles)

// insert
twoDoubles.insert(7.0, at: 1)
print("insert 7.0 into twoDoubles at index 1", twoDoubles)
// remove
var removedDoubles = twoDoubles.remove(at: 1)
print("remove the index 1 from twoDoubles and return the value")
print("twoDoubles", twoDoubles)
print("removedDouble", removedDoubles)

// iterating over an array
for item in shopingList {

}
for (index, value) in shopingList.enumerated() {

}