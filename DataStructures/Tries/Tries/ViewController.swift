//
//  ViewController.swift
//  Tries
//
//  Created by DevMountain on 10/23/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var autocompleter = Trie<String>()
    var searchTerm: [String] = []
    var saveSearchText: String = ""
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var autoCompleteSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoCompleteSearchBar.delegate = self
        autocompleter.add(item: ["B","L","U","E"])
        autocompleter.add(item: ["B","R","E", "A", "K"])
        autocompleter.add(item: ["B","L","A","M","E"])
        autocompleter.add(item: ["B","L","A","C","K"])
        autocompleter.printAllNodes()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UISearchBarDelegate{
    
   
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var node: TrieNode<String>!
        if searchText.count < saveSearchText.count{
            node = autocompleter.currentNode.parent
        }else{
            let searchString = String(searchText.last ?? "Z")
            let searchNode = TrieNode(value: searchString)
            node = autocompleter.findChild(from: autocompleter.currentNode, searchNode: searchNode)
        }
        saveSearchText = searchText
        autocompleter.moveCurrentTo(node: node)
    }
}

import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueArray<T>: Queue {
    
    private var array: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}


class TrieNode<T> {
    
    var value: T?
    var children: [TrieNode<T>] = []
    var searched: Bool = false
    var parent: TrieNode<T>?
    
    func forEachDepthFirst(visit: (TrieNode<T>) -> Void){
        visit(self)
        print("ForEachDepthFirst Currently at \(self.value)")
        self.children.forEach{
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    init(value: T?){
        self.value = value
    }
}

class Trie<NodeValue: Equatable>{
    
    var rootNode: TrieNode<NodeValue> = TrieNode<NodeValue>(value: nil)
    var currentNode: TrieNode<NodeValue>
    private var nodeQueue = QueueArray<TrieNode<NodeValue>>()
    
    init(){
        currentNode = rootNode
    }
    public func printAllNodes(){
        rootNode.forEachDepthFirst { (node) in
            print(node.value ?? "Root Node")
        }
    }
    
    @discardableResult
    public func moveCurrentTo(node: TrieNode<NodeValue>) -> TrieNode<NodeValue>?{
        if let childNode = findChild(from: currentNode, searchNode: node){
            currentNode = childNode
            print(self.showCurrentPossiblities())
            return childNode
        }else{
            currentNode = node
            print(self.showCurrentPossiblities())
            return nil
        }
    }
    
    var allValues: [[NodeValue]] = []
    var values: [NodeValue] = []
    var firstRecursion: Bool = true
    
    func goDeepOnNode(node: TrieNode<NodeValue>){
        if let value = node.value{
            values.append(value)
            if let nextNode = findUnsearchedChildren(of: node){
                firstRecursion = false
                goDeepOnNode(node: nextNode)
            }
        }else{
            let valuesCopy = values.map{ $0 }
            allValues.append(valuesCopy)
            values = []
        }
    }
    
    func findUnsearchedChildren(of node: TrieNode<NodeValue>) -> TrieNode<NodeValue>?{
        for child in node.children{
            if child.searched == false{
                child.searched = true
                return child
            }
        }
        return nil
    }
    
    
    private func getPossibilities(for node: TrieNode<NodeValue>) -> [[NodeValue]]{
        var bigArray = [[NodeValue]]()
        var valuesArray: [NodeValue] = []
        node.forEachDepthFirst { (node) in
            
            if node.value == nil{
                guard node !== rootNode else { return }
                var hasParent = true
                var workingNode: TrieNode<NodeValue>? = node
                
                while hasParent == true{
                    print("Has Parent is \(hasParent)")
                    if let parentValue = workingNode?.parent?.value{
                        print("parent has a value of \(parentValue)")
                        valuesArray.append(parentValue)
                        workingNode = workingNode?.parent
                        print("😯 Working Node moving up the tree. working node is now \(workingNode?.value)")
                    }else{
                        let arrayCopy = Array(valuesArray.reversed())
                        print("copying values array: \(valuesArray) new array is \(arrayCopy)")
                        bigArray.append(arrayCopy)
                        print("appended. big array is now \(bigArray)")
                        valuesArray = []
                        hasParent = false
                    }
                }
            }
        }
        return bigArray
    }
    
    private func diveDeeper(from node: TrieNode<NodeValue>, for searchNode: TrieNode<NodeValue>){
        print("Looking for \(searchNode.value) in children of \(node.value).  the parent node has children \(node.children.map{ $0.value }))")
        if let child = findChild(from: node, searchNode: searchNode){
            nodeQueue.dequeue()
            print("Child Found. Diving Deeper into NodeQueue.  Next Node is \(nodeQueue.peek?.value)")
            guard let nextNode = nodeQueue.peek else {return}
            diveDeeper(from: child, for: nextNode)
        }else{
            //            guard let parentNode = nodeQueue.peek else {return}
            print("No Child Found. Contructing branch from \(nodeQueue.description)")
            createBranchFromCurrentNodeQueue()
            print("appending \(String(describing: searchNode.value)) with children \(searchNode.children.compactMap{ $0.value })) to parent node\(node.value)")
            node.children.append(searchNode)
            searchNode.parent = node
        }
    }
    
    public func add(item: [NodeValue]){
        nodeQueue.enqueue(rootNode)
        item.forEach{ nodeQueue.enqueue(TrieNode(value: $0))}
        guard let firstNode = nodeQueue.dequeue(),
            let nextNode = nodeQueue.peek else {return}
        diveDeeper(from: firstNode, for: nextNode)
    }
    
    private func createBranchFromCurrentNodeQueue(){
        print(nodeQueue.peek?.value ?? "Z")
        if let node = nodeQueue.dequeue(){
            
            print(node.value)
            if let nextNode = nodeQueue.peek{
                node.children.append(nextNode)
                nextNode.parent = node
                print("appending \(nextNode.value) to \(node.value)")
                createBranchFromCurrentNodeQueue()
            }else{
                print("appending nil node to the end of \(node.value))")
                let terminator = TrieNode<NodeValue>(value: nil)
                node.children.append(terminator)
                terminator.parent = node
            }
        }
    }
    
    public func showCurrentPossiblities() -> [[NodeValue]]{
        return getPossibilities(for: currentNode)
    }
    
    func findChild(from parent: TrieNode<NodeValue>, searchNode: TrieNode<NodeValue>) -> TrieNode<NodeValue>?{
        for child in parent.children{
            if child.value == searchNode.value{
                return child
            }
        }
        return nil
    }
}

