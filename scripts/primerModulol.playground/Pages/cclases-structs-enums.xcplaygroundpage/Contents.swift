//: [Previous](@previous)

import Foundation

//Clases, estructuras y enums
class Vehicle{
    
    // atributos
    let brand : String
    let wheels: Int?
    var regNumber: String?
    var owner : String?
    
    var type: String { // Propiedad computada
        return (wheels ?? 0) > 0 ? "land" : "other"
    }
    
    var registration: (owner: String,  regNumber: String)?{
        get {
            if let owner, let regNumber{
                return (owner, regNumber)
            }
            return nil
        }
        set(newRegistration){
            if let newRegistration{
                owner = newRegistration.owner
                regNumber = newRegistration.regNumber
            }
        }
    }
    
    // constructor
    init(brand: String, wheels: Int = 4){
        self.brand = brand
        self.wheels = wheels
    }
    
    // metodos
    func move(){
        print("Moving")
    }
    func stop(){
        print("Stop")
    }
    
}

let myVehicle = Vehicle(brand: "Toyota")
myVehicle.owner = "Me"

let manusVehicle = Vehicle(brand: "Honda")

manusVehicle.owner = "Manu"
manusVehicle.owner
manusVehicle.type
manusVehicle.regNumber
manusVehicle.registration

manusVehicle.registration = ("Grecia" , "00001")
manusVehicle.type
manusVehicle.regNumber
manusVehicle.registration
manusVehicle.wheels

// Herencia
class Car: Vehicle{
    var doors : Int
    // polimorfismo de metodos en herencia
    override var type: String{
        return "Car"
    }
    
    override func move(){
        print("My car moves")
    }
    
    override func stop(){
        super.stop()
        print("my car is stop")
    }
    
    init(brand: String, doors: Int ,wheels: Int = 4) {
        self.doors = doors
        super.init(brand: brand, wheels: 4)
        
    }
    convenience init(brand: String, doors: Int){
        self.init(brand: brand, doors: doors ,wheels: 4)
    }
}

var myCar = Car(brand: "Suzuki",doors: 4)
myCar.registration = ("Grecia", "000001")
myCar.move()
myCar.stop()
myCar.type
myCar.registration
myCar.wheels

//: [Next](@next)
