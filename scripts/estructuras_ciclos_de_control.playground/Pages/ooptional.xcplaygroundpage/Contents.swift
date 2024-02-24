//: [Previous](@previous)

import Foundation

// optionals
var  cellphone: String = "5532085143"
var landline: String? = nil

// con let se desenvuelve si es que hay un dato
if let landline {
    print(landline)
}

//guard let landline else {fatalError()}
//print(landline)

//landline! => force unwrap operator, forza el unwrap
print(landline ?? cellphone) // operador que permite validar si hay algo, y si no, devuelve un valor por default, es lo mismo que lanline != nil ? lanline! : cellphone




//: [Next](@next)
