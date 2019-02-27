// Week 3 - Day 2 - Heap, Trie



import Foundation
// What is a Heap?
// It's a tree where the root node is either the smallest or the largest element in the tree.

// What is percolating?

// When do you percolate up or down?
// How efficient is a Heap?

class MinHeap<T: Comparable>{
  //MARK: - Helpers
  
  private var theGoods: [T] = []
  
  private func getLeftChildIndex(for parentIndex: Int) -> Int{
    return 2 * parentIndex + 1
  }
  
  private func getRightChildIndex(for parentIndex: Int) -> Int{
    return 2 * parentIndex + 2
  }
  
  private func getParentIndex(for childIndex: Int) -> Int{
    return ((childIndex - 1)/2)
  }
  
  private func leftChild(for index: Int) -> T?{
    let leftIndex = getLeftChildIndex(for: index)
    guard leftIndex < theGoods.count else { return nil }
    return theGoods[leftIndex]
  }
  
  private func rightChild(for index: Int) -> T?{
    let rightIndex = getRightChildIndex(for: index)
    guard rightIndex < theGoods.count else { return nil }
    return theGoods[rightIndex]
  }
  
  private func parent(for index: Int) -> T{
    return theGoods[getParentIndex(for: index)]
  }
  
  private func heapifyDown(from index: Int){
    if let leftChild = leftChild(for: index){
      var switchIndex: Int!
      if let rightChild = rightChild(for: index){
        switchIndex = leftChild < rightChild ? getLeftChildIndex(for: index) : getRightChildIndex(for: index)
      }else {
        switchIndex = getLeftChildIndex(for: index)
      }
      theGoods.swapAt(index, switchIndex)
      heapifyDown(from: switchIndex)
    }
  }
  
  private func heapifyUp(from index: Int){
    if parent(for: index) > theGoods[index]{
      let parentIndex = getParentIndex(for: index)
      theGoods.swapAt(index, parentIndex)
      heapifyUp(from: parentIndex)
    }
  }
  
  private func printLevel(_ level: Int, totalItemCount: Int, numberOfElements: Int){
    let startingIndex = totalItemCount
    let endIndex = startingIndex + numberOfElements
    for i in startingIndex..<endIndex{
      guard i < theGoods.count - 1 else { return }
      print(theGoods[i], terminator: " ")
    }
    print("\n")
    printLevel(level+1, totalItemCount: totalItemCount + numberOfElements, numberOfElements: numberOfElements * 2)
  }
  
  //MARK: - Public Data Structure Methods
  
  public func peek() -> T? {
    return theGoods.first
  }
  
  public func poll() -> T? {
    guard !theGoods.isEmpty else { return nil}
    let item = theGoods.first
    theGoods[0] = theGoods.remove(at: theGoods.count - 1)
    heapifyDown(from: 0)
    return item
  }
  
  public func add(aGood: T){
    theGoods.append(aGood)
    heapifyUp(from: theGoods.count - 1)
  }
  
  public func printFormattedHeap(){
//    print(theGoods[0])
    printLevel(1, totalItemCount: 0, numberOfElements: 1)
  }
}

let myHeap = MinHeap<Int>()
let numbers = [2,4,5,7,8,12,1,4,54,7,65]
let moreNumbers = [90,87,45,34,23,12,65,7,8,2,3,4,5,6,7,87]
numbers.forEach{ myHeap.add(aGood: $0) }
moreNumbers.forEach{ myHeap.add(aGood: $0) }

//myHeap.printFormattedHeap()
myHeap.printFormattedHeap()

// What is a Trie?
// What is a Trie used for?

//Please take a look at the "Tries" full XCode project in this repository for an implemenation

// How efficient is looking up in a Trie?
// How would you implement a Trie?
