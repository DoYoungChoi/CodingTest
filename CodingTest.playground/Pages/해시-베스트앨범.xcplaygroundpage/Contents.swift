import Foundation

let location = 0
var priorities: [Int] = [1, 2, 9, 1, 2, 1]

var currentLocation = location
var result = 1

while (!priorities.isEmpty) {
    if priorities.filter { $0 > priorities[0] }.isEmpty {
        print("result: \(result)")
    } else {
        let value = priorities.removeFirst()
        priorities.append(value)
        result += 1
    }
}
