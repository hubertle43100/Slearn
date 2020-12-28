import UIKit

//(Int, Int) -> Int
func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    
    //return n1 * n2
    return operation(n1,n2)
    
}

//func add (no1: Int, no2: Int) -> Int {
//    return no1 + no2
//}

//func multiply (no1: Int, no2: Int) -> Int {
//    return no1 * no2
//}

//calculator(n1: 2, n2: 3)
//calculator(n1: 2, n2: 3, operation: add)

calculator(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) -> Int in
    return no1 * no2
})

//var a = 2 basically infers that 2 is an integer
let result = calculator(n1: 2, n2: 3) {$0 * $1} //trailing closure
print(result)

//$0, $1  --> (1st parameter, 2nd parameter)

let array = [6,3,4,3,2,6,3]

//func addOne (n1: Int) -> Int {
//    return n1 + 1
//}

 //(n1) in n1 + 1
print(array.map({$0 + 1}))

let newArray = array.map{"\($0)"}


