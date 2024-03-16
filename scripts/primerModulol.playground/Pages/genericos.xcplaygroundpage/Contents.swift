//: [Previous](@previous)

import Foundation


struct Stack<TElement>{
    var items = [TElement]()
    
    mutating func push(_ newItem: TElement){
        items.append(newItem)
    }
    
    mutating func pop() -> TElement?{
        guard !items.isEmpty else{
            return nil
        }
        
        return items.removeLast()
    }
    
//    func map<U>(_ transformer: (TElement) -> U) -> Stack<U> {
//        var mappedItems = [U]()
//        for item in items{
//            mappedItems.append(transformer(mappedItems))
//        }
//        
//        return mappedItems
//    }
    
}
//
//protocol IteratorProtocol{
//    associatedtype Element
//    mutating func next() -> Element?
//}

extension Stack : CustomStringConvertible{
    var description: String{
        return "[\(items.reduce(""){"\($0) , \($1)"})]"
    }
}

struct StackIterator<T>: IteratorProtocol{
    var stack: Stack<T>
    
    mutating func next() -> T?{
        return stack.pop()
    }
}

var myStack = Stack<Int>()

for i in 0...10{
    myStack.push(i)
}

//let stringStack = myStack.map { element in "\(element)"}

print(myStack)
//print(stringStack)

for _ in 0...10{
    print(myStack.pop() ?? "is empty")
}

print(myStack)

// map
func myMap<T , U>(_ items: [T], _ transformer: (T) -> U) -> [U]{
    var result = [U]()
    
    for element in items{
        result.append(transformer(element))
    }
    
    return result
}

let items = [1,2,3,4,5,6,7,8]
let itemsTransformed = myMap(items){ number in "\(number)" }
print(itemsTransformed)


// Type Constrains
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool{
    return first == second
}

func checkIfDescriptionMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U)-> Bool{
    first.description == second.description
}

checkIfDescriptionMatch(1, "1")

struct Car {
    let name: String
    let year: Int
}

extension Car: Equatable{
    static func == (lhs: Car, rhs: Car)-> Bool {
        lhs.year == rhs.year
    }
}

let myFirstCar = Car(name: "Corolla", year: 2015)
let mySecondCar = Car(name: "Civic", year: 2017)

print(checkIfEqual(myFirstCar, mySecondCar))
//: [Next](@next)
