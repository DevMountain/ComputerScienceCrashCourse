// Week 4 - Day 3 - Technical Interviews


// Remote Directions
// Given a remote A-Z. Make a function that takes in a string and returns an array of strings where each string contains the directions for how to spell the given word. Start your directions from 'A' for the first letter and then subsequent letters from the previous letter.
//
// A - B - C - D
// E - F - G - H
// I - J - K - L
// M - N - O - P
// Q - R - S - T
// U - V - W - X
// Y - Z
//


struct Coord {
    let col: Int
    let row: Int
    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}

let startingPosition = Coord(0,0)
let coords: [Character: Coord] = ["A":Coord(0,0),
                                  "B":Coord(0,1),
                                  "C":Coord(0,2),
                                  "D":Coord(0,3),
                                  "E":Coord(1,0),
                                  "F":Coord(1,1),
                                  "G":Coord(1,2),
                                  "H":Coord(1,3),
                                  "I":Coord(2,0),
                                  "J":Coord(2,1),
                                  "K":Coord(2,2),
                                  "L":Coord(2,3),
                                  "M":Coord(3,0),
                                  "N":Coord(3,1),
                                  "O":Coord(3,2),
                                  "P":Coord(3,3),
                                  "Q":Coord(4,0),
                                  "R":Coord(4,1),
                                  "S":Coord(4,2),
                                  "T":Coord(4,3),
                                  "U":Coord(5,0),
                                  "V":Coord(5,1),
                                  "W":Coord(5,2),
                                  "X":Coord(5,3),
                                  "Y":Coord(6,0),
                                  "Z":Coord(6,1)]

func getDirections(for word: String) -> [String] {
    let word = word.uppercased()
    var directions = [String]()
    var currentPosition: Coord = startingPosition
    for letter in word {
        directions.append(getDirection(to: letter, with: currentPosition))
        if let position = coords[letter] {
            currentPosition = position
        }
    }
    return directions
}

func getDirection(to letter: Character, with currentPosition: Coord) -> String {
    guard let nextPosition = coords[letter] else {
        return ""
    }
    var direction = ""
    let rowDiff = currentPosition.row - nextPosition.row
    let colDiff = currentPosition.col - nextPosition.col
    
    if rowDiff > 0 {
        direction += String(repeating: "U", count: rowDiff)
    } else if rowDiff < 0 {
        direction += String(repeating: "D", count: rowDiff * -1)
    }
    if colDiff > 0 {
        direction += String(repeating: "L", count: colDiff)
    } else if colDiff < 0 {
        direction += String(repeating: "R", count: colDiff * -1)
    }
    return direction
}

getDirections(for: "DOG")
