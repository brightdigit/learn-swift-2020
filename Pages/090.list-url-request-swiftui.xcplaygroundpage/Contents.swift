//: [Previous](@previous)

import Combine
import SwiftUI
import PlaygroundSupport

struct Person : Identifiable, Codable {
  let id : Int
  let name : String
  
  init(id : Int, name: String) {
    self.id = id
    self.name = name
  }
}


let decoder = JSONDecoder()

class PeopleModel : ObservableObject {
  @Published var list  = [Person(id: 1, name: "test")]

  let publisher =
  {
    URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com/users")!)
      .map(\.data)
      .decode(type: [Person].self, decoder: JSONDecoder())
      .catch{ _ in Empty<[Person], Never>() }
      
    
  }()
  var cancellable : AnyCancellable!
  
  init () {
    self.cancellable = publisher.receive(on: DispatchQueue.main).assign(to: \.list, on: self)
  }
}

struct ContentView : View {
  @ObservedObject var people = PeopleModel()
  
  var body : some View {
    
    List(people.list) { (person) in
      Text(person.name)
    }
  }
}

PlaygroundPage.current.setLiveView(ContentView())
PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
