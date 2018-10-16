// Big O Day 2 - O(log n), O(2^n)



// What is the big O of the following functions
let array1: [Int] = [1,2,3,5,6,3,4,5,2]
let array2: [Int] = [0,1,2,3,4,5,6,7,8,9,10]

// O(n)
func sumAndProduct(array: [Int]) {
    print("\n\n")
    var sum = 0
    var product = 1
    for i in 0..<array.count {
        sum += array[i]
    }
    for i in 0..<array.count {
        product *= array[i]
    }
    print("sum is: \(sum)")
    print("product is: \(product)")
    print("\n\n")
}

sumAndProduct(array: array1)


















// O(n^2)
func printPairs(array: [Int]) {
    print("\n\n")
    for i in 0..<array.count {
        for j in 0..<array.count {
            print("(\(array[i]), \(array[j]))")
        }
    }
    print("\n\n")
}

printPairs(array: array2)




















// O(n^2/2) -> O(n^2)

func printPairsUnordered(array: [Int]) {
    print("\n\n")
    for i in 0..<array.count {
        for j in i..<array.count {
            print("(\(array[i]), \(array[j]))")
        }
    }
    print("\n\n")
}


printPairsUnordered(array: array2)




















let sortedArray = [1,2,3,5,7,8,10,13,14,16,20,21]

//func find(num: Int, inArray array: [Int]) -> Bool {
//    for number in array {
//        if num == number {
//            return true
//        }
//    }
//    return false
//}
//
//
//find(num: 3, inArray: sortedArray)
//























// ASSUMPTION: The array we're using is sorted
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



















func doSomethingWith(array: [Int]) {
    for i in 0...5 {
        print(i)    
    }
}




































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


