import Foundation

struct MyStructure {
    let instanceProperty = "ABC"
    static let typeProperty = "123"
    
    func instanceMethod() {
        
    }
    
    static func typeMethod() {
        
    }
    
}

let myStructure = MyStructure()
print(myStructure.instanceProperty)
myStructure.instanceMethod()

print(MyStructure.typeProperty)
MyStructure.typeMethod() //don't need to initlialize object from struct
