//: [Previous](@previous)

import Foundation

let numbers = [4, 1, 2, 1]
let target = 4

var count = combinationSum(array: [], k: 0, target: 4)
print(count)

func combinationSum(array: [Int], k: Int, target: Int) -> Int {
    if k == numbers.count {
        if array.reduce(0) { $0 + $1 } == target {
            return 1
        } else {
            return 0
        }
    } else {
        var count1 = combinationSum(array: array + [numbers[k]], k: k+1, target: numbers.count)
        var count2 = combinationSum(array: array + [-numbers[k]], k: k+1, target: numbers.count)
        return count1 + count2
    }
}
