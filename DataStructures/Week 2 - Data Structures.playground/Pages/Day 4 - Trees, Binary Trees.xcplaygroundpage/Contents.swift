// Week 2 - Day 4 - Trees, Binary Trees

// Trees

// Definition

// Trees must have
// 1. A tree must have one root node which has zero or more child nodes.
// 2. Every child node must have zero or more child nodes.

// Trees cannot have
// 1. Cycles

// Trees may have
// 1. Any type of value stored in the nodes.
// 2. Can have any order in the node values.
// 3. Any number of child nodes.
// 4. Children nodes may or may not have links back to their parents.

// What is the height of a tree?
// What is a depth of a node?


import Foundation

//General Purpose Tree

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

// Types of Trees

// 1. Binary Trees
//     Rules - Can have 0-2 children.

// 2. Binary Search Tree
//     Rules - The left hand side must be less than the parent.
//           - The Right hand side must be more than the parent.

// When is a tree Degenerate?
// When is a tree Balanced?
// When is a tree Complete?
// When is a tree Full?
// When is a tree Perfect?

import Foundation

public class BinaryNode<Element> {
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

extension BinaryNode {
    
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}


public struct BinarySearchTree<Element: Comparable> {
    
    public private(set) var root: BinaryNode<Element>?
    public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
}

extension BinarySearchTree {
    
    public func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

private extension BinaryNode {
    
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

extension BinarySearchTree {
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}

// MARK: - Example
var exampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    return bst
}

// When is a tree Degenerate?
// A tree where each node has only zero or one children.

// When is a tree Balanced?
// When the node count of the left side of the tree and the right side of the tree are roughly equal.

// When is a tree Complete?
// A tree is complete when all nodes are inserted as far left as possible and only when the current layer is full do they go to the new layer.

// When is a tree Full?
// A full tree is where all nodes either have zero or the max number of children possible. (For a Binary tree that's two)

// When is a tree Perfect?
// A perfect tree is where all leaf nodes have the same level, (or only differ by 1) (a complete tree is a type of perfect tree)



// Can a BST have duplicate nodes?
// Yes you have to change the way that the BST is organized though and it might add complexity to the tree.
// (i.e. Linked list of duplicated at each node, or a left: <= while right: > rule.)
exampleTree.description


// Assignment
// Make a Degenerate Tree
BinarySearchTree.node(.empty, "0", BinaryNode.node(.empty, "1", BinaryTree.node(.empty, "2", BinaryTree.node(.empty, "3", .empty))))
// Make a Perfect Tree
BinarySearchTree.node(BinaryTree.node(.empty, "2", .empty), "1", BinaryTree.node(.empty, "2", .empty))
// Make a Binary Seach Tree
BinarySearchTree.node(BinaryTree.node(.empty, "0", .empty), "1", BinaryTree.node(.empty, "2", .empty))

exampleTree.contains(3)
