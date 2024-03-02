//: [Previous](@previous)

import Foundation

// closures
let volunteerCount = [1,3,10,20,77,13,88]

//let sortedVolunteerCount = volunteerCount.sorted(by: {(lhs: Int, rhs: Int) -> Bool in return lhs < rhs})
//let sortedVolunteerCount = volunteerCount.sorted(by: {(lhs, rhs) in lhs > rhs})
//let sortedVolunteerCount = volunteerCount.sorted(by: {$0 > $1})
//let sortedVolunteerCount = volunteerCount.sorted {$0 > $1} // Trailing closure
let sortedVolunteerCount = volunteerCount.sorted(by: >) // la forma muyyyyy simplificada

print(sortedVolunteerCount)


func format(numbers: [Double], using formatter: (Double) -> String = {"\($0)"}) -> [String]{
    var result = [String]()
    
    for number in numbers {
        let transformer = formatter(number)
        result.append(transformer)
    }
    
    return result
}

let rounder : (Double) -> String = { (number: Double) -> String in
    "\(Int(number.rounded()))"
}

let volunteerAverages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]

let roundedVolunteerAverages = format(numbers: volunteerAverages, using: rounder)

print(roundedVolunteerAverages)

print(format(numbers: volunteerAverages))

//func experimentWithScopes(){
//    let rounder2: (Double) -> String = { "\(Int($0))" }
//}


//: [Next](@next)

//func doAwsomeWork(on: (()->()),then comple){}
