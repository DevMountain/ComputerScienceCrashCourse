// Week 2 - Day 3 - Collection Types

// List - Array
/*
 - Search time of log(n) with a Binary Search
 - Ordered
 - Can have more than one of the same item
 */

// Map - Dictionary <Key, Value>
/*
 - Can search in Constant Time
 - has a set of keys that all contain 1 or more values
 - only one of each key
 - a key can be anything that is hashable
*/
var dict: [String: Int] = ["1":1, "2":2]
print(dict)
dict["1"] = 100
print(dict)
dict["3"] = 3
print(dict)


// Set - Set
/*
 - Unordered
 - In swift the lookup time is Constant as it looks up and stores using a `Hash Value`
 - Only one of each item
 */

print("Hello".hashValue)
print("Hello".hashValue)
print("World".hashValue)
var set: Set = ["Hello", "World", "!"]
print(set)
set.insert("Hello")
print(set)
set.insert("Mr.")
set.insert("wide")
print(set)

// Hashing
/*
 - Constant search time... ish
 - Very common question in interviews
 - Can drastically improve an algorithm if used properly
 */
var hashedArray: [Int?] = Array(repeating: nil, count: 100)
let num1 = 12089
let num2 = 18923
let num3 = 12335
let num4 = 99089

func hashIndex(num: Int) -> Int {
    return (num % 1000) % 100
}

let num1Index = hashIndex(num: num1)
let num2Index = hashIndex(num: num2)
let num4Index = hashIndex(num: num4)

hashedArray[num1Index] = num1
hashedArray[num2Index] = num2
hashedArray[num4Index] = num4
print(hashedArray)




// Seperate Chaining
/*
 - Easy to build
 - Easy to find stuff
 - If built properly has a very fast search time
 */
var bucketArray: [[Int?]] = Array(repeating: [], count: 100)
bucketArray[num1Index].append(num1)
bucketArray[num2Index].append(num2)
bucketArray[num4Index].append(num4)
print(bucketArray)

// Linear probing
/*
 - Faster search time
 - Easier on memory
 - All your data is on the same level
 - A Nightmare to build out
 */


