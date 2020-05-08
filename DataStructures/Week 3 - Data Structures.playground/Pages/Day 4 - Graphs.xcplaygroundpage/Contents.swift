// Week 3 - Day 4 - Graphs
import Foundation
/**
 Graphs: Represents pair-wise relationships between a set of objects
 
 Two parts
 * Vertex (Node)
 * Edge (Arc)
 
 Two main categories
 - Directed Graps: (u,v) != (v, u)
 - Un-Directed Graph: (u,v) == (v, u)
 
 Applications
 - Social Network
 * Vertex - Person
 * Edge - Relationship
 - Route Finding
 * Vertex - intersection
 * Edge - Distance
 -Precedence Constraint
 *Certain things need to be followed in a certain order
 
 How to represent a graph
 
 - Adjacency Matrix
 A graph with V amount of nodes in a VxV matrix
 
 * Pros
 * Easy implementation
 * Removing an edge takes O(1) time
 * Checking for an edge is O(1) time
 
 * Cons
 * Takes up O(N^2) space
 * Adding vertex takes O(N^2) time
 
 - Adjacency List
 An array of linked lists. The length of the array is equal to the number of vertexes, and the number of entries on the linked lists are equal to the number of edges that vertex has
 
 * Pros
 * Saves Space O(|V| + |E|)
 * Adding a vertex is easier
 
 * Cons
 * Checking for an edge is O(N)
 */

//Adjacency Matrix

var adjMatrix = [[Int]]()

func addVertex(withEdgesTo edges: [Int]) {
    //Adding vertex
    adjMatrix.append(Array(repeating: 0, count: adjMatrix.count))
    for x in 0..<adjMatrix.count {
        adjMatrix[x].append(0)
    }
    for x in edges {
        addEdge(from: adjMatrix.count - 1, to: x)
    }
}

func addEdge(from x: Int, to y: Int) {
    adjMatrix[x][y] = 1
    adjMatrix[y][x] = 1
}

func removeEdge(from x: Int, to y: Int) {
    adjMatrix[x][y] = 0
    adjMatrix[y][x] = 0
}

func findEdge(from x: Int, to y: Int) -> Bool {
    return adjMatrix[x][y] == 1
}

func displayMatrix() {
    print("x| \(Array(0..<adjMatrix.count))")
    var rowToPrint: [Int] = []
    for x in 0..<adjMatrix.count {
        for y in 0..<adjMatrix.count {
            rowToPrint.append(adjMatrix[y][x])
        }
        print("\(x)| \(rowToPrint)")
        rowToPrint = []
    }
    print("<---------------------->")
}
displayMatrix()
// 0
addVertex(withEdgesTo: [])
displayMatrix()
// 1
addVertex(withEdgesTo: [0])
displayMatrix()
// 2
addVertex(withEdgesTo: [1])
displayMatrix()
// 3
addVertex(withEdgesTo: [0,2])
displayMatrix()
// 4
addVertex(withEdgesTo: [0,1,2,3])
displayMatrix()

removeEdge(from: 3, to: 0)
displayMatrix()


// Adjacency List
var adjList = [Set<Int>]()

func addVertex2(withRelations: [Int]) {
    adjList.append([])
    for x in withRelations {
        addEdge2(from: adjList.count - 1, to: x)
    }
}

func addEdge2(from x: Int, to y: Int) {
    adjList[x].insert(y)
    adjList[y].insert(x)
}

func removeEdge2(from x: Int, to y: Int) {
    adjList[x].remove(y)
    adjList[y].remove(x)
}

func findEdge2(from x: Int, to y: Int) -> Bool {
    adjList[x].contains(y)
}

func displayList() {
    for x in 0..<adjList.count {
        print("\(x)| \(adjList[x])")
    }
    print("<---------------------->")
}

displayList()
// 0
addVertex2(withRelations: [])
displayList()
// 1
addVertex2(withRelations: [0])
displayList()
// 2
addVertex2(withRelations: [1])
displayList()
// 3
addVertex2(withRelations: [0,2])
displayList()
// 4
addVertex2(withRelations: [0,1,2,3])
displayList()

removeEdge2(from: 3, to: 0)
displayList()















































// What is a Graph? Is a set of vertecies and a set of edges that connects those vertecies.

// Definitions
// 1. Vertex or Nodes - A dot or a space on the graph that represents a state.
// 2. Edge, links, ties, or relations - Represents some connection between two nodes.
// 3. Adjacency - When two nodes are connected by one edge.
// 4. Path - When a node is connected to another node by one or more edges.
// 5. Loop - An edge that connects one node back to itself.
// 6. Parallel Edges - A duplicate edge that connects the same two nodes.
// 7. Degree of a Vertex - The number of edges out of that node. In Directed Graphs this can be broken into an in degree and an out degree.
// 8. Pendent Vertex - A node that has only one edge.
// 9. Isolated Vertex - A node with zero edges.











































// Types of Graphs

// 1. Null Graph - Is a graph with no edges.
// 2. Trivial Graph - A graph with only one node and no edges.
// 3. Non-Directed Graph - Each of the edges are bi-directional. {a,b}
// 4. Directed Graph - Edges only go one way. (a,b)
// 5. Simple Graph - A graph with no loops and no parallel edges.
//      1. The max number of edges possible is n(n-1)/2 where n is the number of vertecies.
//      2. The max number of graphs with n vertecies is 2^(n(n-1)/2)
// 6. Connected Graph - All the nodes are connected in the graph.
// 7. Disconnected Graph - Not all the nodes are connected.
// 8. Regular Graph - A graph where all of the nodes have the same degree.
// 9. Complete Graph - All nodes have a direct connection to every other node.
// 10. Cyclic Graph -
// 11. Acyclic Graph -









































// What are graphs used for?
// https://www.youtube.com/watch?v=7JlCfKLVEzs
// What is a Turing Machine?
