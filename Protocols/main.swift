//certification on flying
protocol CanFly {
    func fly() // can't have '{ }' in protocol
}

extension CanFly {
    func fly() {
        print("The object takes off into the air.")
    }
}

class Bird {
    
    func fly(){
        print("The bird takes off into the air.")
    }
    
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print("The bird makes a new bird in a shell.")
        }
    }
    
//    func fly() {
//        print("The bird flaps its wings and lifts off into the sky.")
//    }
}

class Eagle: Bird, CanFly {
//    func fly() {
//        print("The bird flaps its wings and lifts off into the sky.")
//    }
    
    
    func soar(){
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) { //bird --> Canfly
        flyingObject.fly()
    }
}

//struct Airplane: {  has to be a class in order to inherit
    
//Proctcol can be inherit by struct and classes
struct Airplane: CanFly{ //changed back to a struct
//    func fly() { //OVERRIDE: force override (headache are given b/c it inherits bird
//        print("The airplane uses its engine to lift off into the air.")
//    }
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()

let myPenguin = Penguin()
myPenguin.layEgg()
myPenguin.swim()
//myPenguin.fly() //penguin can't fly

let myPlane = Airplane() //not part of bird family
//myPlane.layEgg() //stupid stupid stupid
myPlane.fly()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle) //can't pass in penguin cause it cannot fly
