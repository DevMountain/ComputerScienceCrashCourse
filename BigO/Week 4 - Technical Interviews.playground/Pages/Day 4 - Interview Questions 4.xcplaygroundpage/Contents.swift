// Week 4 - Day 4 - Technical Interviews


// Stack Min - How would you design a stack which in addition to push and pop, has a function min() which
// returns the minimum element? push(), pop() and min() should all operate in O(1) time.

import DataStructure

public class MinStack<T: Comparable> {
    private var mainStack: [T]
    private var minStack: [T]
    
    public init() {
        mainStack = .init()
        minStack = .init()
    }
    
    public func peek() -> T? {
        return mainStack.last
    }
    
    public func min() -> T? {
        return minStack.last
    }
    
    public func push(_ value: T) {
        mainStack.append(value)
        
        if !minStack.isEmpty && value > min()! { return }
        minStack.append(value)
    }
    
    public func pop() -> T? {
        guard !mainStack.isEmpty else { return nil }
        
        let lastValue = mainStack.removeLast()
        if lastValue == min() {
            minStack.removeLast()
        }
        return lastValue
    }
}


// Practice Questions and create the approach.

//  1. String Compression - Write a function to perform basic string compression using the counts of reppeated
//     characters. For example, the string aabcccccaaa would become a2b1c5a3. If the compressed version of the
//     string is not smaller than the original string your method should return the original string.

//  2. Check Balanced - Implement a function to check if a binary tree is balanced. For the purposes of this
//     question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node
//     never differ by more than one.

//  3. Three in One - Describe how you could use a single array to implement three stacks.

//  4. Rotate Matrix - Given an image represented by an NxN matrix, write a method to rotate the image by 90 degrees.
//     How would you do this in place?

//  5. An animal shelter, which holds only dogs and cats operates on a strictly "first in, first out" basis.
//     People must adopt either the "oldest"(based on arrival time) of all the animals at the shelter, or they
//     can select whether they would prefer a dor or a cat (and will recieve the oldest animal of that type).
//     They cannot select which specific animal they would like. Create the data structures to maintain this
//     system and implement operations such as enqueue(), dequeueAny(), dequeueDog(), and dequeueCat().
//     You may only use a LinkedList data structure.

//  6. Remove Dups - Write code to remove duplicates from an unsorted linked list.

//  7. Is Unique - Implement an algorithm to determine if a string has all unique characters.

//  8. URLify - Write a funciton to replace all spaces in a string with "%20". How could you add additional
//     percent encodings?

//  9. Route Between Nodes - Given a directed graph, design an algorithm to find out whether there is a route
//     between two nodes.

// 10. Check Permutation - Given two strings, write a method to decide if one is a permutation of the other.

// 11. Delete middle node - Implement an algorithm that deletes a node in the middle of a singly linked list,
//     given only access to that node.

// 12. Return kth to Last - Implement an algorithm to find the kth to last element of a singly linked list.
//     How would you do this if you didn't have access to the size from the start?

// 13. Minimal Tree - Given a sorted (increasing order) array with unique integer elements, write an algorithm
//     to create a binary search tree with minimal height.

// 14. Validate BST - Implement a function to check if a binary tree is a binary seach tree.
