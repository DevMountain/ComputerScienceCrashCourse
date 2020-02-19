// Big O Day 4 - Time vs. Space


// What is the space complexity of the two following functions?
func factorial(_ n: Int) -> Int {
    if n < 0 {
        return -1
    } else if n == 0 {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}





// Time Complexity vs. Space Complexity
// What is the difference between time and space complexity?
// How do we count time complexity? How many loops it does. How long it takes.
// How do we count space complexity? How much storage are you using? How much memory are you using?
// - The size of your arrays, or maps, or other data structures.
// - Recursive calls add 1 element of space per call.



func fib(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fib(n-1) + fib(n-2)
    }
}





var memoFibNumbers: [Int:Int] = [1:1, 2:1]
func memoFibNumber(_ number: Int) -> Int {
    if let fibNumber = memoFibNumbers[number] {
        return fibNumber
    } else {
        memoFibNumbers[number] = memoFibNumber(number - 1) + memoFibNumber(number - 2)
        return memoFibNumbers[number]!
    }
}

//: [Prev](@previous)

