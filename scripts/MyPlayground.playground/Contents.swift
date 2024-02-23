import UIKit

/*
 variables y constantes
 */
var greeting:String = "Hello, playground" // var => varia el valor en tiempo de ejecucion

print(greeting)

let constante = "hola" // let => constante en tiempo de ejecucion

// tipos de dato
var entero:Int = 1
var doble:Double = 2.0
var texto:String = "hola"
var booleano:Bool = true


let maxValInt = Int.max
let minValInt = Int.min
let maxValUInt = UInt.max
let minValUInt = UInt.min

let binario = 0b1010
let binario2 = 0x1010
binario + binario2
// operaciones aritmeticas
200 + 6
200 - 6
200 * 6
200 / 6

200 > 6
200 < 6
200 >= 6
200 <= 6
200 == 6
200 != 6

var x = 10
x+=1

// strings

var str1 = "hola"
var str2 = "mundo"

// interpolacion
var str3 = "\(str1) \(str2)"

// metodos string
str3.isEmpty // si es vacio
str3.count // tamaño de la cadena o numero de elemento en el arreglo

// estructuras de datos
//arrays
var arreglo = ["hola" , "aas"]
var arreglo1 : [String] = [] // array vacio
arreglo[1]
arreglo.append("Grecia")
//arreglo.insert(contentsOf:"Italia", at: 2)

var dict: [String:String] = [
    "a":"1",
    "b":"asd",
    "c":"3.0",
    "d":"asds",
]

dict["f"] = "asdds"
dict["c"] = nil
dict.removeValue(forKey: "d")

// tuplas
var alumno : (String, Int) = (
    nombre: "joel",
    edad: 2
)
alumno.1
//alumno.edad

// Sets
var letters = Set<Character>()
letters.insert("a")

var conjunto: Set = ["a","b","c"]
var conjunto1: Set<String> = ["a","b","c"]


