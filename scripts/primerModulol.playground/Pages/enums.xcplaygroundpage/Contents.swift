//: [Previous](@previous)

import Foundation


// enums
enum AnimalType: Int, CaseIterable {
    case mammal
    case bird, reptile
    var string: String{
        switch self{
        case .bird: return "bird"
        case .reptile: return "reptile"
        case .mammal: return "mammal"
        }
    }
}

var type1 = AnimalType.bird
var type2: AnimalType = .reptile
type1.string
type1.rawValue
type2.rawValue
type2.string

var arrAnimalTypes = AnimalType.allCases
for i in arrAnimalTypes{
    print(i.string)
}

enum Pet: String {
    case dog = "🐶"
    case cat = "🐈"
    case mouse = "🐭"
    case parrot = "🦜"
    case turtle = "🐢"
    
    var type: AnimalType{
        switch self {
        case .dog , .cat , .mouse:
            return .mammal
        case .parrot:
            return .bird
        case .turtle:
            return .reptile
        }
    }
    
    init?(name : String) {
        switch name{
        case "dog": self.init(rawValue: "🐶")
        case "cat": self = .cat
        default: return nil
        }
    }
}

var myPet = Pet.dog
myPet.rawValue
myPet.type

var yourPet = Pet(rawValue: "🐶")
yourPet
Pet(name: "cat")


enum ContactMethod {
    case email(String)
    case phone(Int)
    case mail(streetName: String, zipCode: String, streetNumber: String)
    
    var value: String {
        switch self{
        case .email( let value): return value
        case .phone( let no): return "\(no)"
        default: return ""
        }
        
    }
}

var myEmail = ContactMethod.email("esparajorge03@me.com")
var yourEmail = ContactMethod.email("ghgh@your.com")
var yourPhone = ContactMethod.phone(12333)

switch myEmail {
case .email(let string):
    print(string)
case .phone(let int):
    print(int)
case .mail(let streetName, let zipCode, let streetNumber):
    print(streetName + zipCode + streetNumber)
}

// enum recursivo
enum ArithmeticExpression{
    case number(Int)
    indirect case addition( ArithmeticExpression , ArithmeticExpression )
    indirect case substraction( ArithmeticExpression , ArithmeticExpression )
}

func eval(expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value): return value
    case let .addition(left, right): return eval(expression: left) + eval(expression: right)
    case let .substraction(left, right): return eval(expression: left) - eval(expression: right)
    }
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let sum2 = ArithmeticExpression.addition(sum, sum)

eval(expression: sum2)
//: [Next](@next)
