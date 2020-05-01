/**
 Bool, Char, Int8 = 1
 Int16, short = 2
 floats, Int32, Int, long = 4
 Double, Int64 = 8
 Collection = (Size of type)n
 */


// Time - O(1)
// Space Real - O(12)
// Space Simple - O(1)
func ex1(a: Int, b: Int, c: Int) -> Int { //a - 4, b - 4, c - 4
    return a + b + c
}

// Time - O(n)
// Space Real - 4n + 12
// Space Simple - O(n)
func ex2(a: [Int], b: Int) -> Int { // a - 4n, b - 4
    var total: Int = 0 // total - 4
    
    for i in a { //i - 4
        total += i
    }
    
    total += b
    return total
}
// Time - O(n)
// Space Real - O(n)
// Space Simple - O(n)
func ex3(name: String) -> String {
    return name.lowercased()
}

// Time - nlog(n)
// Space Real - 4(4n) + 4
// Space Simple - O(n)
// Space with Stack - m log(n)
// Simple Stack Space - log(n)
func quicksort(_ a: [Int]) -> [Int] { // 4n
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2] // 4
    let less = a.filter { $0 < pivot } // 4n
    let equal = a.filter { $0 == pivot } // 4n
    let greater = a.filter { $0 > pivot } // 4n
    
    return quicksort(less) + equal + quicksort(greater)
}

