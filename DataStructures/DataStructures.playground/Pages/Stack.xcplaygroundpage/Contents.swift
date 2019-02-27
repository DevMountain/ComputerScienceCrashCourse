import Foundation

//MARK: - VIDEO LINKS
//Conceptual Overview of a Stack: https://vimeo.com/devmountain/review/320111190/a55f511fa3
//Live Walkthrough of this Implementation:  https://vimeo.com/devmountain/review/320111352/f8f3e0d43a


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

