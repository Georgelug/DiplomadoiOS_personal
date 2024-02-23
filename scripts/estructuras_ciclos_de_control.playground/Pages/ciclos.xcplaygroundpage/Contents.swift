//: [Previous](@previous)

import Foundation

// for loop
for i in 0..<10{
    print("i: \(i)")
}

let animals = ["dog", "cat", "elephant"]

for animal in animals{
    print("\(animal)")
}

//rangos mas chidos => stride
for number in stride(from: 0, to: 100, by: 5){
    print("\(number)")
}

// for con diccionarios
let pokemon = [
    "Fire":"Charmander",
    "Water":"Mudkip",
    "Grass":"Turtwig"
]

for  (type , name) in pokemon{
    print("[\(type) : \(name)]")
}

for element in pokemon{
//    print("\(element)")
    print("[\(element.key) : \(element.value)]")
}

let names: Set = ["Dean","Sam","Bobby","Ellen"]

var index = 0
for _ in  names {
    print("\(index)")
    index+=1
}

for (index, name) in names.enumerated(){
    print("\(name) is number \(index)")
}

for (index, (key , value)) in pokemon.enumerated(){
    print("\(index)=>(\(key) , \(value))")
}

for (index , name) in names.enumerated(){
    if index % 2 == 0 {
        continue
    }
    print(index)
}

for (key , value) in pokemon where key == "Grass"{
    print(value)
}

for element in 0...60 where element % 15 == 0{
    print(element)
}

//: [Next](@next)
