
struct Enemy { //can not be inherited
//    var health = 100
//    var attackStrength = 10
    var health: Int
    var attackStrength: Int
    
    init(health: Int, attackStrength: Int){
        self.health = health
        self.attackStrength = attackStrength
    }
    
    mutating func takeDamage(amount: Int){
        health = health - amount
    }
    
    func move() {
        print("Walk forwards.")
    }
    
    func attack(){
        print("Land a hit, does \(attackStrength) damage.")
    }
}
