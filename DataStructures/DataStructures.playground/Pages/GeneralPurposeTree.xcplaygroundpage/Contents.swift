import Foundation

public class TreeNode<T> {
    
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
}

extension TreeNode {
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        
        forEachDepthFirst { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}


// MARK: - Example
func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

let tree = makeBeverageTree()

// Depth First
tree.forEachDepthFirst { print($0.value) }

// Level Order
tree.forEachLevelOrder { print($0.value) }


// Search
if let searchResult1 = tree.search("ginger ale") {
    print("Found node: \(searchResult1.value)")
}

if let searchResult2 = tree.search("WKD Blue") {
    print(searchResult2.value)
} else {
    print("Couldn't find WKD Blue")
}
