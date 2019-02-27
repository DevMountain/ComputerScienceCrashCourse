// Big O Day 1 - O(1), O(n), O(n^2)


var array: [Int] = [1,2,3,4,5,6,7,8,9,10]

func whyWouldYouDoThis(_ array: [Int]) {
    // Print Each Element
    for a in array {
        print(a)
    }
    
    // Prints pairs
    for a in array {
        for b in array {
            print("\(a), \(b)")
        }
    }
}

whyWouldYouDoThis(array)

// O(1)
// O(6) == O(1)

func printNumbers1Through5() {
    for i in 0...5 {
        print(array[i])
    }
}

//Adding big O together
// O(n + n) = O(2n) = O(n)
for i in array {
    print(i)
}
// +
for i in array {
    print(i)
}

//Multiplying big O together
// O(n * n) == O(n^2)
for i in array {
    for j in array {
        print("\(i)\(j)")
    }
}


// O(n^3)
for i in array { //O(n)
    for j in array { // O(n)
        for k in array { // O(n)
            print("\(i)\(j)\(k)")
        }
    }
}

// Gotcha with algorithms
/// The average time for goodLinearSearch is better, however the order of growth is the same. O(n)


func badLinearSearch(array: [Int], element: Int) -> Bool {
    var found = false
    for i in 0...array.count - 1 {
        if array[i] == element {
            found = true
        }
    }
    return found
}



func goodLinearSearch(array: [Int], element: Int) -> Bool {
    for i in array {
        if i == element {
            return true
        }
    }
    return false
}



// What is the Big O of the following funciton?
// O(n^2 + n^3) -> O(n^3)

// n((n*1) + (n*n))
// n(n + n^2)
// n^2 + n^3






// Simplifying Big O

// O(n/2) == O(n)


func printHalfOfArray(array: [Int]) {
    for value in array where value < array.count/2 {
        print(value)
    }
}



// How far can we simplify?

var posts: [Int] = [1,2,3,4,5,6,7,8,9,10]
var comments: [Int] = [1,2,3,4,5,6]

// O(pc)


for post in posts {
    for comment in comments {
        print("\(post)\(comment)")
    }
}


// O(p + c)


for post in posts {
    print("\(post)")
}
for comment in comments {
    print("\(comment)")
}

































//Examples

func multiplyAllNumbersThrough(number: Int) {
    for i in 0..<number {
        for j in 0..<number {
            print(i * j)
        }
    }
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var sum = 0
func linearTime(numbers: [Int]) {
    for number in numbers{
        sum += number
    }
}
































