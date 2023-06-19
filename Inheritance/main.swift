class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {

    }
}

let someVehicle = Vehicle()
print("someVehicle: \(someVehicle.description)")

// use ":" to extends a class
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
print(bicycle.hasBasket)
print("bicycle: \(bicycle.description)")
bicycle.currentSpeed = 15.0
print("bicycle: \(bicycle.currentSpeed)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 3
tandem.currentSpeed = 25.0
print("tandem: \(tandem.description)")

// Overriding Methods
class Train: Vehicle {
    override func makeNoise() {
        print("choo choo choo")
    }
}

let train = Train()
train.makeNoise()

// Overriding Properties
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
print("car: \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4

// use "final" to prevent overriding
class SomeSuperClass {
    final func foo() {
        print("foooooo")
    }
}

class SomeSubClass: SomeSuperClass {
    // override func foo() {
    //     print("ohohohohoh")
    // }
    // compile error,因為父類別的foo()已經被關鍵字"final"宣告為不可override
}