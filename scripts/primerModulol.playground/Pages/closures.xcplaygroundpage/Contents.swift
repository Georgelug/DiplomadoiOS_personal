//: [Previous](@previous)

import Foundation

// closures
let volunteerCount = [1,3,10,20,77,13,88]

//let sortedVolunteerCount = volunteerCount.sorted(by: {(lhs: Int, rhs: Int) -> Bool in return lhs < rhs})
//let sortedVolunteerCount = volunteerCount.sorted(by: {(lhs, rhs) in lhs > rhs})
//let sortedVolunteerCount = volunteerCount.sorted(by: {$0 > $1})
//let sortedVolunteerCount = volunteerCount.sorted {$0 > $1}
let sortedVolunteerCount = volunteerCount.sorted(by: >) // la forma muyyyyy simplificada

print(sortedVolunteerCount)
//: [Next](@next)
