struct FixedLengthRange {
    var firstValue: Int
    let length: Int // constant
}

var rangeOfThree = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThree.firstValue = 9
print(rangeOfThree)
// rangeOfThree.length = 5 // compile error

let rangeOfFour = FixedLengthRange(firstValue: 0, length: 4)
// rangeOfFour.firstValue = 9 // compile error, 因為rangeOfFour是constant

// lazy stored properties
// 如果property較複雜,用lazy的方式在真正要用到的時候才initial
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties
// lazy的property在parallel的狀況下無法保證只會被initial一次
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}


class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}


let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property hasn't yet been created