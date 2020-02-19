// Big O Day 2 - O(log n), O(2^n)



// What is the big O of the following functions
let array1: [Int] = [1,2,3,5,6,3,4,5,2]
let array2: [Int] = [0,1,2,3,4,5,6,7,8,9,10]

let sortedArray = [1,2,3,5,7,8,10,13,14,16,20,21]

func smartFind(num: Int, inArray array: [Int]) -> Bool {
    for number in array {
        if num == number {
            return true
        }
    }
    return false
}

//dumbFind(num: 3, inArray: sortedArray)

//func dumbFind(num: Int, inArray array: [Int]) -> Bool{
//  var found: Bool = false
//
//}


// ASSUMPTION: The array we're using is sorted
//log(n) Logarithmic Time
func find(num: Int, inArray array: [Int]) -> Bool {
    let middleIndex = array.count / 2
    
    if num == array[middleIndex] {
        return true
    } else if array.count == 1 {
        return false
    }
    
    if num < array[middleIndex] {
        return find(num: num, inArray: [Int](array[..<middleIndex]))
    } else {
        return find(num: num, inArray: [Int](array[middleIndex...]))
    }
}

find(num: 8, inArray: sortedArray)


//func calculateRandomJunk(n: Int) -> Int{
//    if n == 0{
//        return 1
//    }
//    print("Calculating Junk n is \(n)")
//    return calculateRandomJunk(n: n-1) + calculateRandomJunk(n: n - 2)
//}
//
//calculateRandomJunk(n: 22)



// O(log n)

// What is the definition of a log?

// log_x(a) = b -> x^b = a

// Do we care about what base the log is?
// Why do we use log_2 as a default?

// Exponential
// O(2^n) and it's variants


func f(_ num: Int) -> Int {
    if num <= 0 {
        return 1
    }
    return f(num - 1) + f(num - 1) // + f(num - 1) will make it O(3^n)
}

f(2)



// Assignment
// Give a real life example of both O(log n) and O(2^n)
// What is the detailed and simplified Big O of this function?
func sumDigits(n: Int) -> Int {
    var sum = 0
    var n = n
    while n > 0 {
        sum += n % 10
        n /= 10
    }
    return sum
}

//: [Previous](@previous)

//: [Next](@next)
