import UIKit

//there is only one copied in between the classes
let defaults = UserDefaults.standard
let sharedURLSession = URLSession.shared

class Car {
    var colour = "Red"
    
    static let singletonCar = Car()
}

//let myCar = Car()
//myCar.colour = "Blue"
//
//let yourCar = Car()
//print(yourCar.colour)

let myCar = Car.singletonCar
myCar.colour = "Blue"

let yourCar = Car.singletonCar
print(yourCar.colour)

class A {
    init() {
        Car.singletonCar.colour = "Brown"
    }
}
class B {
    init() {
        print(Car.singletonCar.colour)
    }
}

let a = A()
let b = B()
