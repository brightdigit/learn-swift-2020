//: [Previous](@previous)

import Foundation

class Employee : CustomStringConvertible {
  let profile : Profile
  var manager : Employee?
  
  init (profile : Profile, manager : Employee? = nil){
    self.profile = profile
    self.manager = manager
  }
  
  var description: String {
    return "name:\(self.profile.name) with manager:\(self.manager?.profile.name)"
  }
  
  func hire (employee: Employee) {
    employee.manager = self
  }
}

struct Profile {
  var name : String
  
  init(name: String) {
    self.name = name
  }
}

let names = ["Byron Fisher","Garrett Doyle","Angel Hammond","Brianna Bradley","Evelyn Ellis"]

var manager : Employee? = nil
var employees = [Employee]()
for name in names {
  let newEmployee = Employee(profile: Profile(name: name), manager: manager)
  employees.append(newEmployee)
  manager = newEmployee
}
print(employees)

var foundCeo : Employee?

for employee in employees {
  if foundCeo != nil {
    break
  }
  if employee.manager == nil {
    foundCeo = employee
  }
}
print()
if let ceo = foundCeo {
  for employee in employees {
    if employee !== ceo {
      ceo.hire(employee: employee)
    }
  }
}

//guard let ceo = foundCeo else {
//  return
//}
//
//for employee in employees {
//  if employee !== ceo {
//    ceo.hire(employee: employee)
//  }
//}
  
print(employees)
//: [Next](@next)
