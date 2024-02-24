//: [Previous](@previous)

import Foundation

// las estructuras no heredan, tienen un constructor por default
struct Dog{
    // propiedades almacenadas con observadores
    var name: String{
        willSet {
            print("my new name is \(newValue) my original name was \(name)")
        }
        didSet{
            print("my old name is \(oldValue) my name is \(name)")
        }
    }
    var adopted: Bool
    
    // etiquetas para diferenciar sobrecarga de metodos
    init(adopted name: String){
        self.adopted = true
        self.name = name
    }
    
    init(bought name: String){
        self.init(name: name, isAdopted: false)
    }
    
    init(name: String, isAdopted: Bool){
        self.name = name
        self.adopted = isAdopted
    }
    
}

var dante = Dog(name: "Dante", isAdopted: true)
dante.name = "Firulais"

var yourDog = dante
var theirDog = Dog(adopted: "Rocky") // manda a llamar el constructor con la etiqueta adopted
var ourDog = Dog(bought: "Fifi") // manda a llamar el constructor con la eqtiqueta bought

// definicion de un tipos de dato, variables de tipo
struct Temp{
    static let boilingPoint = 100
}

Temp.boilingPoint

//: [Next](@next)
