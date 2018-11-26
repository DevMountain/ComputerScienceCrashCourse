import UIKit

protocol Pizza: CustomStringConvertible {
    func getCost() -> Double
    func getDescription() -> String
}

// Base Class
class PlainPizza: Pizza {
    func getCost() -> Double {
        return 4.0
    }
    
    func getDescription() -> String {
        return "Thin Dough"
    }
    
    var description: String {
        return "🍕 \(getDescription)\n💸 \(getCost())\n"
    }
}


// Decorator <Abstract>
class ToppingsDecorator: Pizza {
    var description: String {
        return "🍕\(getDescription())\n💸 $\(getCost())\n"
    }
    
    private let decoratedPizza: Pizza
    
    required init(decoratedPizza: Pizza) {
        self.decoratedPizza = decoratedPizza
    }
    
    func getCost() -> Double {
        return decoratedPizza.getCost()
    }
    
    func getDescription() -> String {
        return decoratedPizza.getDescription()
    }
    
}


class Mozzarella: ToppingsDecorator {
    required init(decoratedPizza: Pizza) {
        super.init(decoratedPizza: decoratedPizza)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 1.0
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", " + "Mozzarella"
    }
}

class TomatoSauce: ToppingsDecorator {
    override func getCost() -> Double {
        return super.getCost() + 0.50
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", " + "Tomato Sauce"
    }

}

// MARK: - EXAMPLE
var myPizza: Pizza = PlainPizza()
myPizza = TomatoSauce(decoratedPizza: Mozzarella(decoratedPizza: myPizza))
print(myPizza)

var veganPizza: Pizza = PlainPizza()
veganPizza = TomatoSauce(decoratedPizza: myPizza)
print(veganPizza)














































// Core Component
protocol Character {
    func getHealth() -> Int
}

// Concrete Components
struct Orc: Character {
    func getHealth() -> Int {
        return 10
    }
}

struct Elf: Character {
    func getHealth() -> Int {
        return 5
    }
}

// Decorator
protocol CharacterType: Character {
    var base: Character { get }
}

// Concrete Decorators
struct Warlord: CharacterType {
    
    let base: Character
    
    func getHealth() -> Int {
        return 50 + base.getHealth()
    }
    
    // New responsibility
    func battleCry() {
        print("RAWR")
    }
}

struct Epic: CharacterType {
    
    let base: Character
    
    func getHealth() -> Int {
        return 30 + base.getHealth()
    }
}

let orc = Orc()
let orcWarlord = Warlord(base: orc)
let epicOrcWarlord = Epic(base: orcWarlord)
let doubleEpicOrcWarlord = Epic(base: epicOrcWarlord)
let elf = Elf()
let elfWarlord = Warlord(base: elf)
print(elf.getHealth())

