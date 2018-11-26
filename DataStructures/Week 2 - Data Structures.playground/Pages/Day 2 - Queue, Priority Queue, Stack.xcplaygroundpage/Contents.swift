// Week 2 - Day 2 - Arrays and Linked Lists


// Queue
// Properties:
// First In - First Out: FIFO
// This is a line of objects

// Operations in a Queue
//  - enqueue() - add to the back of the line
//  - dequeue() - remove from the front of the line
//  - peek()

public struct Queue<T> {
    
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func enqueueu(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public mutating func peek() -> T? {
        return array.first
    }
}




// Stack
// Properties:
// Last In - First Out: LIFO
// This is a stack of objects

// Operations in a Stack
//  - push() - add an element to the top of the stack
//  - pop() - remove and return the top element on the stack
//  - top() - returns the top element without removing it.

//Simple Stack
public struct SimpleStack<T> {
    
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public mutating func top() -> T? {
        return array.last
    }
}







//Dressed up Stack

public struct Stack<Element> {
    private var storage: [Element] = []
    public init() {}
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        
        let stackElements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
    // Initialization
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    // CRUD
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
}

extension Stack: ExpressibleByArrayLiteral { // Makes it so you can initialize a stack like you would an array
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

// MARK: - Example
var stack: Stack = [1.0, 2.0, 3.0, 4.0]
print(stack, "Before pop")
stack.pop()
print(stack, "After pop")
