//: [Previous](@previous)
import UIKit

//MARK: - VIDEO LINKS
//Conceptual Overview and live walkthrough of this implementation:  https://vimeo.com/304967758


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
    
    private func printLevel(_ level: Int, totalItemCount: Int){
        let numberOfElements = Int(pow(Double(level), 2))
        let startingIndex = totalItemCount
        for i in startingIndex...startingIndex + numberOfElements{
            guard i < theGoods.count - 1 else { return }
            print(theGoods[i], terminator: " ")
        }
        print("\n")
        printLevel(level+1, totalItemCount: totalItemCount + numberOfElements)
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
        printLevel(0, totalItemCount: 0)
    }
}

let myHeap = MinHeap<Int>()
myHeap.add(aGood: 2)
let numbers = [2,4,5,7,8,12,1,4,54,7,65]
let moreNumbers = [90,87,45,34,23,12,65,7,8,2,3,4,5,6,7,87]
numbers.forEach{ myHeap.add(aGood: $0) }
moreNumbers.forEach{ myHeap.add(aGood: $0) }
myHeap.printFormattedHeap()

