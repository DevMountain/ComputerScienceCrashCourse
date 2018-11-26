import UIKit

// Superclass
class Pokemon {
    
    func attack() {
        print("Attacking!")
    }
    
    let flyable: Flyable
    
    var tryToFly: String {
        return flyable.fly()
    }
    
    init(fly: Flyable) {
        self.flyable = fly
    }
}

// Subclasses
class Butterfry: Pokemon {}
class Pikachu: Pokemon {}
class HoOh: Pokemon {}

protocol Flyable { // Interface / Protocol
    func fly() -> String
}

class CanNormalFly: Flyable {
    func fly() -> String {
        return "Is normal flying"
    }
}

class CanLegendaryFly: Flyable {
    func fly() -> String {
        return "Is flying very fast"
    }
}

class CantFly: Flyable {
    func fly() -> String{
        return "Can't fly"
    }
}

let pikachu = Butterfry(fly: CanNormalFly())
let buttery = Pikachu(fly: CanNormalFly())
let hooh = Pikachu(fly: CanLegendaryFly())

pikachu.tryToFly
buttery.tryToFly
hooh.tryToFly

