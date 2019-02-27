import Foundation

//MARK: - VIDEO LINKS
//Conceptual Overview of a Queue:  https://vimeo.com/320114616
//Live Walkthrough of this Implementation:  https://vimeo.com/320114270

public struct Queue<T> {
  private var array: [T] = []
  public init() {}
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public mutating func enqueue(value: T){
    array.append(value)
  }
  
  public mutating func dequeue() -> T? {
    return isEmpty ? nil : array.removeFirst()
  }
  
  public func peek() -> T?{
    return array.first
  }
}

extension Queue: CustomStringConvertible {
  public var description: String {
    return array.description
  }
}

extension Queue: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: T...) {
    array = elements
  }
}

var queue = Queue<String>()
queue.enqueue(value: "Cow")
queue.enqueue(value: "Rabit")
queue.enqueue(value: "Duck")
queue.enqueue(value: "Lion")
queue.enqueue(value: "Bear")
//
//print(queue.description)
//
//queue.dequeue()
//
//print(queue.description)
//
//queue.peek()
//
//print(queue.description)

var movieQueue: Queue = ["Star Wars", "Lord of the Rings", "Harry Potter", "The Dark Knight", "Incpetion"]

print(movieQueue.description)

movieQueue.dequeue()

print(movieQueue.description)

