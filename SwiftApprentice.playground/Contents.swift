import UIKit
import XCTest
import os
import Foundation

// MARK: Chapter #4 challenges

//var countdown: [Int] = []
//
//for i in 0...10 {
//    countdown.insert(i, at: 0)
//}
//print(countdown)
//
//for i in 0...10 {
//    print(10 - i)
//}
//
//var doubleCountdown: [Double] = []
//var number: Double = 0.0
//for _ in 0...10 {
//    doubleCountdown.append(number)
//    number += 0.1
//}
//print(doubleCountdown)
//
//var number2: Double = 0.0
//for _ in 0...10 {
//    print(number2)
//    number2 += 0.1
//}
//
//for i in 0...10 {
//    print(Double(i) * 0.1)
//}

// MARK: Chapter #9 challenges

//#1
// Write a function that takes a string and prints out the count of each character in the
// string. For bonus points, print them ordered by the count of each character. For
// bonus-bonus points, print it as a nice histogram.
// Hint: You could use # characters to draw the bars.

//func stringToCharacterCount(from string: String) {
//    guard !string.isEmpty else { return }
//    var countDict: [Character: Int] = [:]
//
//    for char in string {
//        countDict[char, default: 0] += 1
//    }
//
//    let sortedKeys = countDict.keys.sorted { countDict[$0]! > countDict[$1]! }
//
//    let maxCount = countDict[sortedKeys.first!]!
//
//    for key in sortedKeys {
//    let countForCharacter = countDict[key]!
//    let heightOfBar = (countForCharacter * 20) / maxCount
//    let bar = String(repeating: "#", count: heightOfBar)
//    print("\(key) : \(bar) \(countForCharacter)")
//  }
//}
//
//stringToCharacterCount(from: "Abraham Lincoln was the best president of the USA")


//#2
// Write a function that tells you how many words there are in a string. Do it without
// splitting the string.
// Hint: try iterating through the string yourself.

//func numberOfWords(for string: String) -> Int {
//    guard !string.isEmpty else { return 0 }
//    var wordsCount = 1
//
//    for i in string where i.isWhitespace {
//        wordsCount += 1
//    }
//    return wordsCount
//}
//
//print(numberOfWords(for: "Abraham Lincoln was the best president of the USA"))

//#3
// Write a function that takes a string that looks like ???Galloway, Matt??? and returns one
// which looks like ???Matt Galloway???, i.e., the string goes from "<LAST_NAME>,
// <FIRST_NAME>" to "<FIRST_NAME> <LAST_NAME>".

//func reverseFullName(for string: String) -> String {
//    guard !string.isEmpty else { return "String is empty" }
//    var firstName: String = ""
//    var secondName: String = ""
//    guard var midIndex = string.firstIndex(of:",") else { return "" }
//    firstName = String(string[string.index(after: midIndex)...])
//    secondName = String(string[..<midIndex])
//
//    return firstName + " " + secondName
//}
//
//print(reverseFullName(for: "Galloway, Matt"))


// #4
// A method exists on a string named components(separatedBy:) that will split the
// string into chunks, which are delimited by the given string, and return an array
// containing the results.
// Your challenge is to implement this yourself.
// Hint: There exists a view on String named indices that lets you iterate through all
// the indices (of type String.Index) in the string. You will need to use this.

//func customComponents(of string: String, delimitedBy delimiter: Character) -> [String]? {
//    guard !string.isEmpty else { return nil }
//    var components: [String] = []
//    var currentWordStartIndex = string.startIndex
//
//    for i in string.indices {
//        if string[i] == delimiter {
//            let word = string[currentWordStartIndex..<i]
//            components.append(String(word))
//            currentWordStartIndex = string.index(after: i)
//        }
//    }
//    let lastWord = string[currentWordStartIndex...]
//    components.append(String(lastWord))
//
//    return components
//}
//
//print(customComponents(of: "Dog,Cat,Badger,Snake,Lion", delimitedBy: ","))


// #5
// Write a function that takes a string and returns a version of it with each individual
// word reversed.
// For example, if the string is ???My dog is called Rover??? then the resulting string would
// be ???yM god si dellac revoR???.
// Try to do it by iterating through the indices of the string until you find a space and
// then reversing what was before it. Build up the result string by continually doing that
// as you iterate through the string.
// Hint: You???ll need to do a similar thing as you did for Challenge 4 but reverse the
// word each time. Try to explain to yourself, or the closest unsuspecting family
// member, why this is better in terms of memory usage than using the function you
// created in the previous challenge.

//func wordReverser(for string: String) -> String {
//    guard !string.isEmpty else { return "There is an empty string" }
//    var reversed: String = ""
//    var currentWordStartIndex = string.startIndex
//
//    for i in string.indices {
//        if string[i].isWhitespace {
//            let word = string[currentWordStartIndex..<i]
//            reversed += String(word).reversed() + " "
//            currentWordStartIndex = string.index(after: i)
//        }
//    }
//    let lastWord = string[currentWordStartIndex...]
//    reversed += String(lastWord).reversed() + " "
//
//    return reversed
//}
//
//print(wordReverser(for: "The quick brown fox jumps over the lazy dog"))


// MARK: Chapter #18
/*
// Create a checking account for John. Deposit $300.00
let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.00)
// Write a check for $200.00
let check = johnChecking.writeCheck(amount: 200.0)!
// Create a checking account for Jane, and deposit the check.
let janeChecking = CheckingAccount()
janeChecking.deposit(check)
janeChecking.balance // 200.00
// Try to cash the check again. Of course, it had no effect on
// Jane???s balance this time :]
janeChecking.deposit(check)
janeChecking.balance // 20
*/

/*
class SavingsAccount: BasicAccount {
    var interestRate: Double
    private let pin: Int
    
//    @available(*, deprecated, message: "Use init(interestRate: Double, pin: Int) instead")
//    init(interestRate: Double) {
//        self.interestRate = interestRate
//    }
    
    init(interestRate: Double, pin: Int) {
        self.interestRate = interestRate
        self.pin = pin
    }
    
//    @available(*, deprecated, message: "Use func processInterest(pin: Int) instead")
//    func processInterest() {
//            let interest = balance * interestRate
//            deposit(amount: interest)
//    }
    
    func processInterest(pin: Int) {
        if pin == self.pin {
            let interest = balance * interestRate
            deposit(amount: interest)
        }
    }
}

class Doctor: ClassyPerson {
    override var fullName: String {
        "Dr. \(super.fullName)"
    }
}

//print(Doctor(firstName: "Kerby", secondName: "Strong"))
//
//var newAccount = SavingsAccount(interestRate: 1.2)
//
//newAccount.processInterest()

func creatingAccount() -> some Account {
    return CheckingAccount()
}

class BankingTests: XCTestCase {
    var checkingAccount: CheckingAccount!
    
    override func setUp() {
        super.setUp()
        checkingAccount = CheckingAccount()
    }
    
    override func tearDown() {
        checkingAccount.withdraw(amount: checkingAccount.balance)
        super.tearDown()
    }
    
    func testNewAccountBalanceIsZero() {
        XCTAssertEqual(checkingAccount.balance, 0)
    }

    func testWritingChecksOverBudgesFails() {
        let writingCheck = checkingAccount.writeCheck(amount: 100)
        XCTAssertNil(writingCheck)
    }
    
    func testFailAPI() {
        guard #available(iOS 14, *) else {
            XCTFail("Only available in iOS 14 and above")
        }
    }
    
    func testSkipAPI() throws {
        guard #available(iOS 14, *) else {
            throw XCTSkip("Only available in iOS 14 and above")
        }
    }
}

BankingTests.defaultTestSuite.run()
*/

// MARK: Challenges #18

// #1
/*
class Logger {
    private init() { }
    
    static let sharedLogger = Logger()
    
    func log(text: String) {
        print(text)
    }
}

//#2
struct Stack<Element> {
    private var elements: [Element] = []
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.last
    }
    
    mutating func push(element: Element) {
        elements.append(element)
    }
    
    mutating func pop() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.removeLast()
    }
}

//#3
let elf = GameCharacterFactory.make(ofType: .elf)
let giant = GameCharacterFactory.make(ofType: .giant)
let wizard = GameCharacterFactory.make(ofType: .wizard)

battle(elf, vs: giant)
battle(wizard, vs: giant)
battle(wizard, vs: elf)
*/
enum FruitType {
    case pear
    case apple
    case orange
}

struct FruitsBox {
    let fruitType: FruitType
    let weight: Int
}

var pearContainer = [FruitsBox]()
var appleContainer = [FruitsBox]()
var orangeContainer = [FruitsBox]()

var totalWeight = 0

func sortingFruits(truckOfFruits: [FruitsBox]) {
    for fruit in truckOfFruits {
        switch fruit.fruitType {
        case .pear: pearContainer.append(fruit)
        case .apple: appleContainer.append(fruit)
        case .orange: orangeContainer.append(fruit)
        }
        
        totalWeight += fruit.weight
    }
}

let loadedTruck: [FruitsBox] = [
    FruitsBox(fruitType: .orange, weight: 230),
    FruitsBox(fruitType: .apple, weight: 34),
    FruitsBox(fruitType: .pear, weight: 339),
    FruitsBox(fruitType: .orange, weight: 230),
    FruitsBox(fruitType: .apple, weight: 38),
    FruitsBox(fruitType: .apple, weight: 95)
]

sortingFruits(truckOfFruits: loadedTruck)
print(pearContainer.count)
print(appleContainer.count)
print(orangeContainer.count)
print(totalWeight)
