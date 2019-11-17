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
}.sorted { (lhs, rhs) -> Bool in
  lhs.name.compare(rhs.name) == .orderedAscending
}

class ApplicationData : ObservableObject {
  @Published var people : [Person]
  
  init (people : [Person]) {
    self.people = people
  }
}


struct ContentView : View {
  @EnvironmentObject var data : ApplicationData
  var body : some View {
    List(self.data.people) { (person) in
      Text(person.name)
    }
  }
}

let liveView = ContentView().environmentObject(ApplicationData(people: people))
PlaygroundPage.current.setLiveView(liveView)

//: [Next](@next)
