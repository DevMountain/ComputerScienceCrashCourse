import Foundation

//MARK: - VIDEO LINKS
//Conceptual Overview of a Stack:
//Live Walkthrough of this Implementation:


public class BSTNode<T: Comparable> {
  public var leftChild: BSTNode?
  public var value: T
  public var rightChild: BSTNode?
  
  public init(value: T, leftChild: BSTNode? = nil, rightChild: BSTNode? = nil){
    self.value = value
    self.leftChild = leftChild
    self.rightChild = rightChild
  }
}

extension BSTNode: CustomStringConvertible {
  
  public var description: String {
    return diagram(for: self)
  }
  
  private func diagram(for node: BSTNode?,
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

public class BinarySearchTree<T: Comparable> {
  public private(set) var root: BSTNode<T>?
  public init() {}
  
  public func insert(_ value: T){
    guard let root = root else {
      let newNode = BSTNode(value: value)
      self.root = newNode
      return
    }
    self.insert(from: root, value: value)
  }
  
  private func insert(from node: BSTNode<T>, value: T) {
    if value >= node.value {
      if let right = node.rightChild {
        insert(from: right, value: value)
      }else {
        let newNode = BSTNode(value: value)
        node.rightChild = newNode
      }
    }else {
      if let left = node.leftChild {
        insert(from: left, value: value)
      }else{
        let newNode = BSTNode(value: value)
        node.leftChild = newNode
      }
    }
  }
  
  
  
  public func contains(value: T) -> Bool {
    guard let root = root else { return false }
    return search(for: value, from: root)
  }
  
  private func search(for value: T, from node: BSTNode<T>) -> Bool {
    if value >= node.value {
      if let right = node.rightChild {
        return search(for: value, from: right)
      }else {
        return false
      }
    }else {
      if let left = node.leftChild {
        return search(for: value, from: left)
      }else {
        return false
      }
    }
  }
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    return root?.description ?? "Empty Tree"
  }
}

let binarySearchTree = BinarySearchTree<Int>()

for i in [17,32,45,2,4,43,12,11,4,16,23,7,3,98,20]{
  binarySearchTree.insert(i)
}
print(binarySearchTree.description)
//print(binarySearchTree.root?.value)
//print(binarySearchTree.root?.rightChild?.value)
//print(binarySearchTree.root?.leftChild?.value)
