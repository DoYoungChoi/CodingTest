//: [Previous](@previous)

import Foundation

func isPrime(number: Int) -> Bool {
    if number <= 1 {
        return false
    }

    for denominator in 2..<number {
        if number % denominator == 0 {
            return false
        }
    }

    return true
}

func getNumbers(_ numbers: String) -> [String] {
    if numbers.count == 1 {
        return [numbers]
    }

    var result: [String] = []
    for indexNum in 0..<numbers.count {

        var copiedNumber = numbers
        let removeIndex = numbers.index(numbers.startIndex, offsetBy: indexNum)
        let popNumber = String(copiedNumber.remove(at: removeIndex))
        result += [popNumber] + getNumbers(copiedNumber).map({ popNumber + $0 })
    }

    return result
}

func solution(_ numbers:String) -> Int {
    let intNumbers = Array(Set(getNumbers(numbers).map({ Int($0)! })))

    return intNumbers.filter({ isPrime(number: $0) }).count
}
