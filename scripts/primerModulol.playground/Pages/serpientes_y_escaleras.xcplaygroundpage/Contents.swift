//: [Previous](@previous)

import Foundation

var tablero = 0...24

var position = 0

var stairs = [
    2:10,
    9:11,
    5:16,
    8:17
]

var snakes = [
    23:15,
    21:10,
    18:7,
    13:3
]
var dado = 0
while position >= 0{
    print("Current position: \(position)")
    dado = Int.random(in:1...6)
    
    position += dado
    print("Dice: \(dado) new position: \(position)")
    
    if(position >= 24){
        print("You won!!")
        break
    }else if snakes[position] != nil{
        print("Snake !!")
        position = snakes[position] ?? position
        continue
    }else if stairs[position] != nil{
        print("Stair !!")
        position = stairs[position] ?? position
        continue
    }
    
}


//: [Next](@next)
