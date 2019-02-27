import Foundation

//VIDEO WAlKTHROUGH: - https://vimeo.com/308815548

protocol Coffee {
  func getCost() -> Double
  func getIngredients() -> String
}

class SimpleCoffee: Coffee {
  func getCost() -> Double {
    return 1.0
  }
  
  func getIngredients() -> String {
    return "Coffee"
  }
}

class CoffeeDecorator: Coffee {
  private let decoratedCoffee: Coffee
  fileprivate let ingredientSeparator: String = ", "
  
  required init(decoratedCoffee: Coffee) {
    self.decoratedCoffee = decoratedCoffee
  }
  
  func getCost() -> Double {
    return decoratedCoffee.getCost()
  }
  
  func getIngredients() -> String {
    return decoratedCoffee.getIngredients()
  }
}

final class Milk: CoffeeDecorator {
  required init(decoratedCoffee: Coffee) {
    super.init(decoratedCoffee: decoratedCoffee)
  }
  
  override func getCost() -> Double {
    return super.getCost() + 0.5
  }
  
  override func getIngredients() -> String {
    return super.getIngredients() + ingredientSeparator + "Milk"
  }
}

final class WhipCoffee: CoffeeDecorator {
  required init(decoratedCoffee: Coffee) {
    super.init(decoratedCoffee: decoratedCoffee)
  }
  
  override func getCost() -> Double {
    return super.getCost() + 0.7
  }
  
  override func getIngredients() -> String {
    return super.getIngredients() + ingredientSeparator + "Whip"
  }
}


var someCoffee: Coffee = SimpleCoffee()
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")
someCoffee = Milk(decoratedCoffee: someCoffee)
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")
someCoffee = WhipCoffee(decoratedCoffee: someCoffee)
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")
