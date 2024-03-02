//: [Previous](@previous)

import Foundation

// First class functions
// Pure functions (funciones que solo realizan una cosa y no alteran cosas fuera de su scope)
// Inmutability (let)
// Strong type
let volunteerAverages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]
// Map
let roundedVolunteerAverages = volunteerAverages.map { "\(Int($0))" }

print(roundedVolunteerAverages)

// Filter
let invitedVolunteers = volunteerAverages.filter { $0 > 5.0 }
print(invitedVolunteers)

// Reduce
let totalVolunteers = volunteerAverages.reduce(0) { partialResult , average in partialResult + average }
print(totalVolunteers)

// map, filter and reduced => high-order function
//: [Next](@next)
