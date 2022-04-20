import UIKit
// MARK: Challenges #4

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

