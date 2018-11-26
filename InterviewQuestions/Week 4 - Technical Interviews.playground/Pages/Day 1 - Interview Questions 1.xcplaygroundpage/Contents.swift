// Week 4 - Day 1 - Technical Interviews


// 1. Listen/Repeat the question/ Clarify the question.
// 2. Think of good examples/your general approach.
// 3. State the Brute Force method.
// 4. Optimizing
// 5. Walk Through
// 6. Test
// 7. Implement


public func inCommon(_ a: [Int], _ b: [Int]) -> [Int] {
    if a.count == 0 || b.count == 0 {
        return [Int]()
    }
    if a.count < b.count {
        return inCommonOrganized(a, b)
    } else {
        return inCommonOrganized(b, a)
    }
}

// This is where a is < b
// O(2a) -> O(a)
private func inCommonOrganized(_ a: [Int], _ b: [Int]) -> [Int] {
    var inCommonArray = [Int]()
    var inCommonDict = [Int: Bool]()
    
    for num in a {
        inCommonDict[a] = false
    }
    for num in b {
        if inCommonDict[b] != nil && inCommonDict[b] == false {
            inCommonDict[b] = true
            inCommonArray.append(b)
        }
    }
    return inCommonArray
}


// String Rotation
// Assume you have a method isSubstring (in swift it's called .contains()) which checks if one word is a substring of another. Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to .contains().

// For example: "watterbottle" is a rotation of "erbottlewat"


// 1. Listen/Repeat the question/ Clarify the question.
// 2. Think of good examples/your general approach.
// 3. Brute Force
// 4. Optimizing
// 5. Walk Through
// 6. Test
// 7. Implement

extension String {
    func isRotation(of other: String) -> Bool {
        return (self + self).contains(other)
    }
}

"waterbottle".isRotation(of: "terbottlewa")
