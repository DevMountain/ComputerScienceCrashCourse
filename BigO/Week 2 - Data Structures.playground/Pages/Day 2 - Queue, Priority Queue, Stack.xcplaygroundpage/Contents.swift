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
//  - push() - add an element to the top of the sack
//  - pop() - remove and return the top element on the stack
//  - top() - returns the top element without removing it.

public struct Stack<T> {
    
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
