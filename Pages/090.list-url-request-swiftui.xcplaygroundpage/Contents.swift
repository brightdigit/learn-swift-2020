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
let publisher =  URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com/users")!)
       .map(\.data)
       .decode(type: [Person].self, decoder: JSONDecoder())
  .assertNoFailure().eraseToAnyPublisher()

class PeopleModel : ObservableObject {
  @Published var list : [Person]

  var cancellable : AnyCancellable!
  
  init () {
    self.list = [Person]()
    self.cancellable =  publisher.receive(on: DispatchQueue.main).sink(receiveValue: { (persons) in
      print(persons)
      self.list = persons
    })
  }
}

struct ContentView : View {
  @ObservedObject var people : PeopleModel
  var cancellable : AnyCancellable!
  
  var body : some View {
    ForEach(people.list) { (person) -> _ in
      
      Text(person.name)
    }
  }
}

var model = PeopleModel()

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(ContentView(people: model))

//: [Next](@next)
