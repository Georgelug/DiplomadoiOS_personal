//: [Previous](@previous)

import Foundation

var point_a = (0.00001,-0.02)
var aux_result = "The coordanate is in"
// quadrant
switch point_a {
case (0,0) : print("\(aux_result) origin")
    
case let (x,0): print("\(aux_result) X axis: \(x)")
    
case let (0,y): print("\(aux_result) Y axis: \(y)")
    
case (0...,0...) : print("\(aux_result) Quadrant I")
    
case (..<0,0...) : print("\(aux_result) Quadrant II")
    
case (..<0,..<0) : print("\(aux_result) Quadrant III")
    
case (0...,..<0) : print("\(aux_result) Quadrant IV")

default: break
}


//: [Next](@next)
