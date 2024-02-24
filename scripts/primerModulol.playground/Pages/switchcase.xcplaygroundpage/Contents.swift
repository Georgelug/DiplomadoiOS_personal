//: [Previous](@previous)

import Foundation

// switch case
var animal = "dog"

switch animal{
case "dog" , "cat": print("It's a common pet")
//    break => es opcional, porque en swift solo realiza el bloque de codigo
case "mouse": print("It's a mouse")
default: break
}

var grade = 9
switch grade{
case ...5: print("Failed")
case 6..<9: print("good grade")
case 9...10: print("Excelent grade")
default: break
}

// validacion con tuplas
let color = (255,255,255)
switch color{
case let(r , g , 255) where r < 255:
    print("Red: \(r) Green: \(g) max blue")
    print("max blue!")
case (_ , 255 , _): print("max green!")
case (255 , _ , _): print("max red!")
default: print("random color")
}

let (r,g,b) = color
print("Red: \(r) green: \(g) blue: \(b) => \(r + g + b)")
//: [Next](@next)

