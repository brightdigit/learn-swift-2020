//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

let names = ["Byron Fisher","Garrett Doyle","Angel Hammond","Brianna Bradley","Evelyn Ellis"]


struct Person : Identifiable {
  let id : UUID
  let name : String
  
  init(id : UUID? = nil, name: String) {
    self.id = id ?? UUID()
    self.name = name
  }
}

let people = names.map{
  Person(id: nil, name: $0)
}

struct ContentView : View {
  var body : some View {
    List(people) { (person) in
      Text(person.name)
    }
  }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
