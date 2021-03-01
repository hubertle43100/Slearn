//IMPORTANT: start with struct then when confident then change to class




////let skeleton = Enemy()
//skeleton.move()
//skeleton.attack()

//let skeleton2 = Enemy() //layout the enemy so you don't have to repeat code
//let skeleton3 = Enemy()

var skeleton1 = Enemy(health: 100, attackStrength: 10) //struct with no "let"
var skeleton2 = skeleton1 //points to the same skeleton (1)

skeleton1.takeDamage(amount: 10)
skeleton2.takeDamage(amount: 10)

print(skeleton1.health)
print(skeleton2.health) // get prints 90 b/c classes are pass through copy

//let dragon = Dragon()
//dragon.wingSpan = 5
//dragon.attackStrength = 15
//dragon.talk(speech: "My teeth are swords! My claws are spears! My wings are a hurricane!")
//dragon.move()
//dragon.attack()
