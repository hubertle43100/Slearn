import UIKit

/* computed properties makes the code dynamic, not have to change alot and makes it easier in general */

let pizzaInInches: Int = 16
var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

//var numberOfSlices: Int = 6
var numberOfSlices: Int { //always specify data type when using computed properties
    get {
        return pizzaInInches - 4 // <-- getter
    }
    set { //only triggers when a new value gets "set"
        print("numberOfSlices now has a new value which is \(newValue)")
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue //newValue == the value of get(returned)
        numberOfPeople = totalSlices / slicesPerPerson
    }
}
numberOfPizza = 6

print(numberOfPeople)

//numberOfSlices = 12

//print(numberOfSlices)

//numberOfSlices = 4

//let a = numberOfSlices * 2
//let a = numberOfSlices + 34

// --- if it only needs one block of code then computed properties might be the answer
//func calcPizzaSlices() {
//    numberOfSlices = pizzaInInches - 4
//}
//
//calcPizzaSlices()
//print(numberOfSlices)
