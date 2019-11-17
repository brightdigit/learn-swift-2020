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

class ApplicationData : ObservableObject {
  @Published var people : [Person]
  
  init (people : [Person]) {
    self.people = people
  }
}

struct ContentView : View {
  @EnvironmentObject var data : ApplicationData
  
  var body : some View {
    ForEach(data.people) { (person) in
      Text(person.name)
    }
  }
}

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
let decoder = JSONDecoder()
let publisher =  URLSession.shared.dataTaskPublisher(for: url)
       .map(\.data)
       .decode(type: [Person].self, decoder: JSONDecoder())
       .assertNoFailure().eraseToAnyPublisher()
let data = ApplicationData(people: [Person]())
let cancellable = publisher.receive(on: DispatchQueue.main).assign(to: \.people, on: data)
let liveView = ContentView().environmentObject(data)
PlaygroundPage.current.setLiveView(liveView)

//: [Next](@next)
