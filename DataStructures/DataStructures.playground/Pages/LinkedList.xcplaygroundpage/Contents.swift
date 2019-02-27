import Foundation

//MARK: - VIDEO LINKS
//Conceptual Overview of a Linked List: https://vimeo.com/devmountain/review/320108637/f6ff990457
//Live Walkthrough of implementation: https://vimeo.com/devmountain/review/320109169/c5e762c66f

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}


// MARK: - Push, Append, Insert(after:)
extension LinkedList {
    
    /// Pushes the value to the front of the list
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Append the value to the tail of the list
    public mutating func append(_ value: Value) {
        // 1
        guard !isEmpty else {
            push(value)
            return
        }
        
        // 2
        tail!.next = Node(value: value)
        
        // 3
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        // 1
        var currentNode = head
        var currentIndex = 0
        
        // 2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        // 1
        guard let head = head else {
            return nil
        }
        // 2
        guard head.next != nil else {
            return pop()
        }
        // 3
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        // 4
        prev.next = nil
        tail = prev
        return current.value
    }
}

// MARK: - Example
var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print("Before popping list: \(list)")
let poppedValue = list.pop()
print("After popping list: \(list)")
print("Popped value: " + String(describing: poppedValue))

