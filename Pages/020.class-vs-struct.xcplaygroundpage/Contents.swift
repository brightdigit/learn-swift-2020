//: [Previous](@previous)

import Foundation

class PersonObject {
  var name : String
  
  init(name: String) {
    self.name = name
  }
}

struct PersonValue {
  var name : String
  
  init(name: String) {
    self.name = name
  }
}

func hello(person value: PersonValue) {
  print("hello", value.name)
}


func hello(person object: PersonObject) {
  print("hello", object.name)
}

let personObject = PersonObject(name: "object")
let personValue = PersonValue(name: "value")
hello(person: personObject)
hello(person: personValue)

personValue.name = "new Value"
personObject.name = "new Object"

hello(person: personObject)
hello(person: personValue)

//: [Next](@next)
