var animal = "cat"

if animal == "dog" {
    print("it´s a fuking 🐶")
}else{
    print("it's not a fuking 🐶")
}

if animal.count < 4 {
    print("less than 4 letters")
}else{
    print("too many letters")
}

if #available(iOS 16.6, *){
    print("Available just for 16.6 +")
}else{
    print("Unavailable")
}

if #unavailable(iOS 16.6){
    print("Unavailable")
}

// operador ternario
var number = 100
var value = number == 100 ? "number = 100" : "not 100"
print(value)


var weather = "nieve"
var time : Int = 20

if weather == "nieve"{
    print("🌨️")
}else if weather == "lluvia"{
    print("🌧️")
}

if(time >= 7 && time <= 18){
    print("Usa bloqueador")
}else if((time >= 19 && time <= 23) || (time >= 0 && time <= 6)){
    print("No necesitas bloqueador")
}

// ~= operador que evalua si un valor esta dentro de un rango

