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



// Assignment
// Make a Degenerate Tree
BinaryTree.node(.empty, "0", BinaryTree.node(.empty, "1", BinaryTree.node(.empty, "2", BinaryTree.node(.empty, "3", .empty))))
// Make a Perfect Tree
BinaryTree.node(BinaryTree.node(.empty, "2", .empty), "1", BinaryTree.node(.empty, "2", .empty))
// Make a Binary Seach Tree
BinaryTree.node(BinaryTree.node(.empty, "0", .empty), "1", BinaryTree.node(.empty, "2", .empty))
