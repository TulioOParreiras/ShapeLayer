import UIKit

protocol Animal {
    var name: String? { get set }
}

protocol Bipede {
    func andarEmPe()
}
protocol AnimalBipede: Animal, Bipede {
    
    
}

typealias NewAnimal = Animal & Bipede

class Dog: Animal {var name: String?
}

class Canguru: NewAnimal {
var name: String?
func andarEmPe() {
    
}
}
