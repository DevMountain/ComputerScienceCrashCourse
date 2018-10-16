// Week 4 - Day 2 - Technical Interviews

// One Away: Ther eare three types of edits that can be performed on this array: inserting an element, removing an element, and replacing an element. Given two arrays write a function to check if thy are one edit (or zero) away.

public func isOneEditAway(_ a1: [Int], _ a2: [Int]) -> Bool {
    if a1.count == a2.count {
        return checkForReplace(a1, a2)
    } else if (a1.count == a2.count + 1) {
        return checkForInsert(a1, a2)
    } else if (a1.count + 1 == a2.count) {
        return checkForInsert(a2, a1)
    } else {
        return false
    }
}

public func checkForReplace(_ a1: [Int], _ a2: [Int]) -> Bool {
    var repeatCount = 0
    for (i, num) in a1.enumerated() {
        if num != a2[i] {
            repeatCount += 1
            if repeatCount > 1 {
                return false
            }
        }
    }
    return true
}

// The large array is guarenteed to be only 1 larger than the small array.
public func checkForInsert(_ smallArray: [Int], _ largeArray: [Int]) -> Bool {
    
    var smallIndex = 0
    var largeIndex = 0
    
    while( largeIndex < largeArray.count && smallIndex < smallArray.count ) {
        if smallArray[smallIndex] == largeArray[largeIndex] {
            smallIndex += 1
            largeIndex += 1
        } else {
            if smallIndex != largeIndex {
                return false
            }
            largeIndex += 1
        }
    }
    
    return true
}


isOneEditAway([1,2,3,4,5], [1,2,3,4,5])
isOneEditAway([1,2,3,4,5], [1,2,3,4,6])
isOneEditAway([1,2,3,4,5], [1,2,4,5])
isOneEditAway([1,2,4,5], [1,2,3,4,5])
isOneEditAway([1,2,3,4,5], [1,2,3,4,5,6])
isOneEditAway([1,2,3,4,5,6], [1,2,3,4,5])
