struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let videoMode = VideoMode()
let resolution = Resolution()

print(videoMode)
print(resolution)

let vga = Resolution(width: 640, height: 480)
print("vga resolution: \(vga)")

// structures and enumerations are value types
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2040
print("cinema: \(cinema), hd: \(hd)")
// cinema被賦予的值是複製了hd的一個新的Resolution

// classes are reference type
let tenEighty = VideoMode()
var alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 60.0
print("alsoTenEighty's frame rate: \(alsoTenEighty.frameRate), tenEighty frame rate: \(tenEighty.frameRate)")

// use "===" and "!==" to check if instance is identical or not
if tenEighty === alsoTenEighty {
    print("same")
}
// 原文：A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, 
// but isn’t a direct pointer to an address in memory, and doesn’t require you to write an asterisk (*) to indicate 
// that you are creating a reference. 
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures