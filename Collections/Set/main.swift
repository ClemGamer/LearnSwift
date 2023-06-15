// generic

// Set contains distinct, hashable and no ordering element.
// Basic types of Swift are hashable by default.

// create and initailize an empty set
var letters = Set<Character>()

// create a set with an array literal
var favoriteGenres: Set<String> = ["Rock", "Classical"]
// shorten
var fav: Set = ["Rock", "Classical"]

// insert
fav.insert("Jazz")
fav.insert("ABC")

// remove
var removed = fav.remove("Rock")

// check whether a set contains a item
if fav.contains("Jazz") {

}

// iterating over a set
print("iterating a set")
for genre in fav {
    print(genre)
}

// iterating over a set in a specific order
print("iterating a set in a specific order")
for genre in fav.sorted() {
    print(genre)
}

// Fundamental Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted() // create a new set with all of the values in both sets
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted() // create a new set with only the values common to both sets
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // create a new set with values not in the specified set
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // create a new set with values in either set, but not both
// [1, 2, 9]

// membership
let setA: Set = [1, 2]
let setB: Set = [3, 4]
let setC: Set = [1, 2, 3, 4]
let setD: Set = [3, 4]

setA.isSubset(of: setC) // determine whether all of the values of a set are contained in the specified set
// true
setB.isStrictSubset(of: setD) // determine whether a set is a subset, but not equal to, a specified set
// false
setB.isStrictSuperset(of: setD) // determine whether a set is a superset, but not equal to, a specified set
// false
setC.isSuperset(of: setB) // determine whether a set contains all of the values in a specified set
// true
setA.isDisjoint(with: setB) // determine whether two sets have no values in common