//: [Previous](@previous)

import Foundation

// Protocolos -> contrato
// encapsulation
// Struct
// Class

// Tablas
protocol TabularDataSource : CustomStringConvertible {
    
    var numberOfRow: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
    
}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible){
    var headerRow = "|"
    var columnWidths = [Int]()
    
    for columnIndex in 0..<dataSource.numberOfColumns{
        let columnLabel = dataSource.label(forColumn: columnIndex)
        let columnHeader = "\(columnLabel)"
        columnWidths.append(columnLabel.count)
        headerRow += columnHeader
        
    }
    
    print(headerRow)
    
    for rowIndex in 0..<dataSource.numberOfRow {
        var output = "|"
        for rowColumnIndex in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: rowIndex, column: rowColumnIndex)
            let paddingNeeded = columnWidths[rowColumnIndex] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined()
            output += "\(padding)\(output)"
        }
        print(output)
    }
    
}

let data = [
    ["Eva", "30", "6"],
    ["Salem", "40", "18"],
    ["Amit", "50", "20"]
]

struct Person{
    let name: String
    let age: Int
    let vacationDays: Int
}


struct Department: TabularDataSource {
    let name: String
    var people: [Person]
    
    mutating func add(_ person: Person){
        people.append(person)
    }
    
    var numberOfRow: Int { people.count }
    var numberOfColumns: Int { 3 }
    
    func label(forColumn column: Int) -> String{
        switch column{
        case 0: "Name"
        case 1: "Age"
        case 2: "Vacation days"
        default: fatalError("Invalid column")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String{
        let person = people[row]
        
        return switch column{
        case 0: person.name
        case 1: "\(person.age)"
        case 2: "\(person.vacationDays)"
        default: fatalError("Invalid column")
        }
        
    }
    
    
    
}

extension Department: CustomStringConvertible{
    var description: String{
        return "\(name):\n \(people.reduce(""){"\($0) \($1)\n"})"
    }
}

var department = Department(name: "Engineering", people: [])

for element in data{
    department.add(Person(name: element[0], age: Int(element[1]) ?? 0, vacationDays: Int(element[2]) ?? 0))
}

// formas para castear
let operationalDataSource: TabularDataSource = Department(name: "HR", people: [])
let hrDepartment = department as Department

// formas para validar el tipo de dato
operationalDataSource is Department

//printTable(department)
print(department)
//: [Next](@next)
