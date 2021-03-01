//1. Force Unwrapping
//2. Check for nil value
//3. Optional Binding
//4. Nil Coalescing Operator
//5. Optional Chaining

struct MyOptional {
    var property = 123
    func method() {
        print("I am the default value")
    }
}
let myOptional: MyOptional?

myOptional = MyOptional() //return real value

//use optional chaining
//print(myOptional?.property) //? == if not nil
print(myOptional?.method())





//let myOptional: String?

//myOptional = "HUBERT"
//myOptional = nil //nil = runtime error


//if myOptional != nil{ //wordy but works (still have to use force unwrap)
//    let text1: String = myOptional! //force unwrap
//    let text2: String = myOptional! //force unwrap
//}
//else{
//    print("My Optional was found to be nil.")
//}




//optional binding makes code clean
//if let safeOptional = myOptional {
//    let text1: String = myOptional! //force unwrap
//    let text2: String = myOptional! //force unwrap
//    print(safeOptional)
//}
//else{
//    print("My Optional was found to be nil.")
//}




//nil Coalescin Operator == (  )??(  )
//let text: String = myOptional ?? "I am the default value" //<-- nil == "  "
//
//print(text)
