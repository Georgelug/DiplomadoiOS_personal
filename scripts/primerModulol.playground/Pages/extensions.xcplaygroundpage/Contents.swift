//: [Previous](@previous)

import Foundation

// Can be used to:
// - Add computed properties
// - Add new initializers
// - Add protocol conformance
// - Add new methods
// - Add emdedded types

// Double -->Squared
extension Double {
    var squared: Double {self * self}
}

let sideLength : Double = 2.0
//let squaredSideLength = sideLength * sideLength
let squaredSideLength = sideLength.squared

print(squaredSideLength)


struct Car{
    let maker: String
    let model: String
    let year: Int
    var fuelLevel: Double{
        willSet{
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1") // condicion que lanza exception si no cumple la condicion
        }
    }
}

extension Car: CustomStringConvertible{
    var description: String{
        return "My car is: \(maker) - \(model)"
    }
}

extension Car{
    init(maker: String, model: String, year: Int){
        self.init(maker: maker, model: model, year: year, fuelLevel: 1)
    }
}

extension Car{
    enum Era{
        case modern, vintage, veteran
    }
    var era: Era{
        switch year{
        case ...1896: .veteran
        case 1897...1919: .vintage
        default: .modern
        }
    }
}

extension Car{
    mutating func emptyFuel(by amount: Double){
        precondition(amount <= 1 && amount >= 0, "Amount to remove must be between 0 and 1" )
        fuelLevel -= amount
    }
    
    mutating func emptyFuel(){
        fuelLevel -= 1
    }
}

let firstCar = Car(maker: "Honda", model: "Civic", year: 2017, fuelLevel: 1)
print(firstCar)
//: [Next](@next)

extension Int{
    var isEven: Bool{
        self.isMultiple(of: 2)
    }
    var isOdd: Bool{
        !self.isMultiple(of: 2)
    }

}

print(1.isEven)
