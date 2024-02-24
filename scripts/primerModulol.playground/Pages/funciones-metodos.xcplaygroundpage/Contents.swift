//: [Previous](@previous)

import Foundation

// funciones
func myAwsomePrintingFunction(value: String){
    print("\(value)")
}

myAwsomePrintingFunction(value: "Hello world")

func add(lhs: Int , rhs: Int){
    print("\(lhs) + \(rhs) = \(lhs + rhs)")
}

func add(lhs: Int , rhs: Int, thirdParameter another: Int){
    print("\(lhs) + \(rhs) + \(another) = \(lhs + rhs + another)")
}

//add(lhs: 4, rhs: 5)

add(lhs: 4, rhs: 5)

add(lhs: 4, rhs: 5, thirdParameter: 6)


// In-Out
var error = "The process failed:"
// nota: no se pasa por referencia, si no que se realiza una copia dentro de la funcion y luego se asigna el valor a la variable externa
func appendErrorCode(code: Int, toErrorString errorString: inout String){
    errorString += " \(code) bad request"
}

print(error)
appendErrorCode(code: 400, toErrorString: &error)
print(error)

// _ es para descartar las etiquetas de los parametros
func printMessage(_ message: String, _ code: Int){
    print("\(message) \(code)")
}

print("hola",2)

// retorno de valores
func welcomeMessage(to name: String) -> String {
    "Welcome to the course \(name)"
}

print(welcomeMessage(to: "George"))

// funciones anidadas y scope
func areaOfTriangle(base: Double, height: Double) -> Double{
    let rectangleArea = base * height
    func divide() -> Double{
        return rectangleArea/2
    }
    return divide()
}

print(areaOfTriangle(base: 1, height: 1))


// Multiple Return
func sortedEvenOddNumber(_ numbers: [Int]) -> (even: [Int] , odd: [Int]) {
    var even = [Int]()
    var odd = [Int]()
    
    for number in numbers{
        if number % 2 == 0{
            even.append(number)
        }else{
            odd.append(number)
        }
    }
    return (even: even, odd: odd)
}

let (even , odd) = sortedEvenOddNumber([0,1,2,3,4,5,6,7,8,9])
print(even)
print(odd)

// retorno de opcionales
func grabMiddleName(fromFullName: (String, String?, String))->String?{
    return fromFullName.1
}

print(grabMiddleName(fromFullName: ("Jorge", nil , "Esparza")) ?? "no middle name")

if let middleName = grabMiddleName(fromFullName: ("Jorge", nil , "Esparza"))) {
    print(middleName)
}

print(fromFullName: ("Jorge", nil , "Esparza"))!)

// Exiting early from function
func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) -> String{
//    return name.middle != nil ? "Hey, \(name.middle)" : "hey there"
    guard let middleName = name.middle  else {
        return "Hey there"
    }
    
    return "Hey, \(middleName)"
}

print(greetByMiddleName(fromFullName("Jorge",nil,"Esparza"))

let sortedNumbers: ([Int] -> ([Int] , [Int])) = sortedEvenOddNumbers

print(sortedNumbers([1,1,2,3,4,5,6]))
//: [Next](@next)
