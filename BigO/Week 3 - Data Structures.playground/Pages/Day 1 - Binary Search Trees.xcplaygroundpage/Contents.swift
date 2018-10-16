// Week 3 - Day 1 - Binary Search Trees


public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}








// When is a tree Degenerate?
// It's a tree where each node typically has 1 child.

// When is a tree Balanced?
// It's a tree where the left and right sides have roughly the same number of nodes.

// When is a tree Complete?
// It's a tree where all of the nodes are inserted in the leftmost position and you don't move to the next layer until the current layer is full.

// When is a tree Full?
// When each node of the tree has 0 or 2 children.

// When is a tree Perfect?
// All the leaf nodes have the same depth or differ by at most 1.



// Binary Search Tree
//     Rules - The left hand side must be less than the parent.
//           - The Right hand side must be more than the parent.

// Can a BST have duplicate nodes?
// Short answer is yes.
// Using a linked list at the node.
// Or changing the left definition to be <=


// Talk about how we search, insert and delete in a Binary Search Tree

// Assignment
// Make a Degenerate Tree
BinaryTree.node(.empty, "0", BinaryTree.node(.empty, "1", BinaryTree.node(.empty, "2", BinaryTree.node(.empty, "3", .empty))))
// Make a Perfect Tree
//let threeNode = BinaryTree.node(.empty, "3", .empty)
//let perfectTree = BinaryTree.node(threeNode, "3", threeNode)
BinaryTree.node(BinaryTree.node(.empty, "3", .empty), "3", BinaryTree.node(.empty, "3", .empty))

// Make a Binary Seach Tree
let threeNode = BinaryTree.node(.empty, "3", .empty)
let fourNode = BinaryTree.node(.empty, "4", .empty)
let eightNode = BinaryTree.node(.empty, "8", .empty)


BinaryTree.node(threeNode, "4", eightNode)











