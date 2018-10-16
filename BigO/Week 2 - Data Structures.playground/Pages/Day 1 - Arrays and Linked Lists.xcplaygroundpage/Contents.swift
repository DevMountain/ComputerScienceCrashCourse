// Week 2 - Day 1 - Arrays and Linked Lists


// Array

// Properties
// - Store an ORDERED list of items.
// - Access the elements in the array in constant time.
// - Amortization - Appending on the end is still constant time.



// Linked List

// Properties
// - Stored an ORDERED list of items.
// - But the location o

let array: [Int] = [12, 45, 2, 21]

for i in array {
    if i == 12 {
        print("found \(i)")
    }
}

public final class LinkedList<T> {
    
    public class LinkedListNode<T> {
        var value: T
        var next: LinkedListNode?
        
        public init(_ value: T) {
            self.value = value
        }
    }
    
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    private var tail: Node?
    var count: Int = 0
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func append(_ value: T) {
        let newNode = Node(value)
        append(newNode)
    }
    
    public func append(_ node: Node) {
        let newNode = node
        if count == 0 {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        count += 1
    }
    
    public subscript(index: Int) -> T? {
        let node = self.node(at: index)
        return node?.value
    }
    
    public func node(at index: Int) -> Node? {
        assert(head != nil, "List is empty")
        assert(index >= 0, "index must be greater than 0")
        
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            
            return node
        }
    }
    
    public func index(for node: Node) -> Int? {
        var index = 0
        var currNode = head
        while currNode !== head {
            index += 1
            if let next = currNode?.next {
                currNode = next
            } else {
                return nil
            }
        }
        return index
    }
    
    // Your assignment is to add the funcitonality to the insert and remove functions.
    public func insert(_ value: T, at index: Int) {
        let newNode = Node.init(value)
        insert(newNode, at: index)
    }
    
    public func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head
            head = newNode
        } else if let prev = node(at: index - 1) {
            let next = prev.next
            newNode.next = next
            prev.next = newNode
        }
    }
    
    @discardableResult public func remove(node: Node) -> T? {
        guard let index = self.index(for: node) else {
            return nil
        }
        let prev = self.node(at: index - 1)
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        node.next = nil
        return node.value
    }
    
}


var practiceList = LinkedList<String>()
practiceList.append("Sally")
practiceList[0]
