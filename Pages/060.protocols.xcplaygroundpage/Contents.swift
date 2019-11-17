//: [Previous](@previous)

import Foundation

protocol Automobile {
  func horn() -> String
}

struct Car : Automobile {
  func horn() -> String {
    return "beep"
  }
}

struct Truck : Automobile {
  func horn() -> String {
    return "honk"
  }
}

let vehicles : [Automobile] = [Car(), Truck()]

for vehicle in vehicles {
  print(vehicle.horn())
}

//: [Next](@next)
