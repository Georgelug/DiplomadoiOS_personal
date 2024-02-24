//: [Previous](@previous)

import Foundation

enum ArithmeticExpression{
    case number(Double)
    indirect case addition( ArithmeticExpression , ArithmeticExpression )
    indirect case substraction( ArithmeticExpression , ArithmeticExpression )
    indirect case multiplication( ArithmeticExpression , ArithmeticExpression )
    indirect case division( ArithmeticExpression , ArithmeticExpression )
    
}

func eval(expression: ArithmeticExpression) -> Double {
    switch expression {
    case let .number(value): return value
    case let .addition(left, right): return eval(expression: left) + eval(expression: right)
    case let .substraction(left, right): return eval(expression: left) - eval(expression: right)
    case let .multiplication(left, right): return eval(expression: left) * eval(expression: right)
    case let .division(left, right): return eval(expression: left) / eval(expression: right)
    }
}

var eight = ArithmeticExpression.number(8)
var one = ArithmeticExpression.number(1)
var four = ArithmeticExpression.number(4)
var two = ArithmeticExpression.number(2)
var six = ArithmeticExpression.number(6)

var sub = ArithmeticExpression.substraction(eight, one)
var mult = ArithmeticExpression.multiplication(four, sub)
var add = ArithmeticExpression.addition(six, mult)
var div = ArithmeticExpression.division(add, two)

eval(expression: div)

//: [Next](@next)
