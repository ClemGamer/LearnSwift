// range
print("range")
for i in 1...5 {
    print(i)
}

// half open range
print("half open range")
let fruits = ["apple", "banana", "orange", "pineapple"]
for i in 0..<fruits.count {
    print(fruits[i])
}

// one-sided range
print("one-sided range example 1")
for fruit in fruits[1...] {
    print(fruit)
}
print("one-sided range example 2")
for fruit in fruits[...2] {
    print(fruit)
}
print("half-open in one-side")
for fruit in fruits[..<2] {
    print(fruit)
}

let range = ...5
range.contains(7) // false
range.contains(-1) // true