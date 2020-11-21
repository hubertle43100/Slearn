import Foundation

class Animal {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Human: Animal{
    func code() {
        print("Typing away...")
    }
}

//fish inheriting animal?
class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water.")
    }
}

let angela = Human(n: "Angela Yu")
let jack = Human(n: "Jack Bauer")
let nemo = Fish(n: "Nemo")
let num = 12 //cannot be added to the array
let number: NSNumber = 23

//they all have a common super class (only animal)
let neighbours: [Any] = [angela, jack, nemo, num] //mix classes(with error)

//[AnyObject]: only come from classes
//[NSOject]: restricted to NSNumber, NSString, etc...
//let neighbours: [AnyObject] = [angela, jack, nemo, num] //mix classes


let neighbors = [angela, jack, nemo]
let neighbor1 = neighbors[0] //check data type first with if statment

//is: = (type checking)
if neighbors[0] is Human { //index 2: Nemo is a fish so yeah ...
    print("First Neighbor is a Human")
}

func findNemo(from animals: [Animal]) {
    for animal in animals {
        //print(animal.name)
        if animal is Fish { //thing inside bracket is a fish
            print(animal.name)
            //animal.breatheUnderWater() //even though we know it is a fish we can't tap into the func
            
            //as!: turn to subclass (ForcedDowncast)
            let fish = animal as! Fish //takes animal and use as! to cast it down to subclass
            fish.breatheUnderWater()
            let animalFish = fish as Animal //raises subclass to headclass
        }
    }
}

findNemo(from: neighbors)

//error when running (Human -> Fish: subclass)
//let fish = neighbors[1] as? Fish//as?: make it optional b/c not sure if object is a fish
//fish?.breatheUnderWater()


//as?: safer way to call methods
if let fish = neighbors[1] as? Fish { //being skipped because of if statement
    fish.breatheUnderWater()
}


//if jack is Human { //going to always be true since we know he is a human
//    print("First Neighbor is a Human")
//}

//let myDouble = 0.0
//let myDoubleAsAnInt = Int(myDouble)
