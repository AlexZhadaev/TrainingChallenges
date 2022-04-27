import UIKit

// MARK: Chapter #4 challenges

var countdown: [Int] = []

for i in 0...10 {
    countdown.insert(i, at: 0)
}
print(countdown)

for i in 0...10 {
    print(10 - i)
}

var doubleCountdown: [Double] = []
var number: Double = 0.0
for _ in 0...10 {
    doubleCountdown.append(number)
    number += 0.1
}
print(doubleCountdown)

var number2: Double = 0.0
for _ in 0...10 {
    print(number2)
    number2 += 0.1
}

for i in 0...10 {
    print(Double(i) * 0.1)
}

// MARK: Chapter #9 challenges

//#1
// Write a function that takes a string and prints out the count of each character in the
// string. For bonus points, print them ordered by the count of each character. For
// bonus-bonus points, print it as a nice histogram.
// Hint: You could use # characters to draw the bars.

func stringToCharacterCount(from string: String) {
    guard !string.isEmpty else { return }
    var countDict: [Character: Int] = [:]
    
    for char in string {
        countDict[char, default: 0] += 1
    }
    
    let sortedKeys = countDict.keys.sorted { countDict[$0]! > countDict[$1]! }
    
    let maxCount = countDict[sortedKeys.first!]!
    
    for key in sortedKeys {
    let countForCharacter = countDict[key]!
    let heightOfBar = (countForCharacter * 20) / maxCount
    let bar = String(repeating: "#", count: heightOfBar)
    print("\(key) : \(bar) \(countForCharacter)")
  }
}

stringToCharacterCount(from: "Abraham Lincoln was the best president of the USA")


//#2
// Write a function that tells you how many words there are in a string. Do it without
// splitting the string.
// Hint: try iterating through the string yourself.

func numberOfWords(for string: String) -> Int {
    guard !string.isEmpty else { return 0 }
    var wordsCount = 1
    
    for i in string where i.isWhitespace {
        wordsCount += 1
    }
    return wordsCount
}

print(numberOfWords(for: "Abraham Lincoln was the best president of the USA"))

//#3
// Write a function that takes a string that looks like “Galloway, Matt” and returns one
// which looks like “Matt Galloway”, i.e., the string goes from "<LAST_NAME>,
// <FIRST_NAME>" to "<FIRST_NAME> <LAST_NAME>".

func reverseFullName(for string: String) -> String {
    guard !string.isEmpty else { return "String is empty" }
    var firstName: String = ""
    var secondName: String = ""
    guard var midIndex = string.firstIndex(of:",") else { return "" }
    firstName = String(string[string.index(after: midIndex)...])
    secondName = String(string[..<midIndex])
    
    return firstName + " " + secondName
}

print(reverseFullName(for: "Galloway, Matt"))


// #4
// A method exists on a string named components(separatedBy:) that will split the
// string into chunks, which are delimited by the given string, and return an array
// containing the results.
// Your challenge is to implement this yourself.
// Hint: There exists a view on String named indices that lets you iterate through all
// the indices (of type String.Index) in the string. You will need to use this.

func customComponents(of string: String, delimitedBy delimiter: Character) -> [String]? {
    guard !string.isEmpty else { return nil }
    var components: [String] = []
    var currentWordStartIndex = string.startIndex
    
    for i in string.indices {
        if string[i] == delimiter {
            let word = string[currentWordStartIndex..<i]
            components.append(String(word))
            currentWordStartIndex = string.index(after: i)
        }
    }
    let lastWord = string[currentWordStartIndex...]
    components.append(String(lastWord))
    
    return components
}

print(customComponents(of: "Dog,Cat,Badger,Snake,Lion", delimitedBy: ","))


// #5
// Write a function that takes a string and returns a version of it with each individual
// word reversed.
// For example, if the string is “My dog is called Rover” then the resulting string would
// be “yM god si dellac revoR”.
// Try to do it by iterating through the indices of the string until you find a space and
// then reversing what was before it. Build up the result string by continually doing that
// as you iterate through the string.
// Hint: You’ll need to do a similar thing as you did for Challenge 4 but reverse the
// word each time. Try to explain to yourself, or the closest unsuspecting family
// member, why this is better in terms of memory usage than using the function you
// created in the previous challenge.

func wordReverser(for string: String) -> String {
    guard !string.isEmpty else { return "There is an empty string" }
    var reversed: String = ""
    var currentWordStartIndex = string.startIndex
    
    for i in string.indices {
        if string[i].isWhitespace {
            let word = string[currentWordStartIndex..<i]
            reversed += String(word).reversed() + " "
            currentWordStartIndex = string.index(after: i)
        }
    }
    let lastWord = string[currentWordStartIndex...]
    reversed += String(lastWord).reversed() + " "
    
    return reversed
}

print(wordReverser(for: "The quick brown fox jumps over the lazy dog"))


