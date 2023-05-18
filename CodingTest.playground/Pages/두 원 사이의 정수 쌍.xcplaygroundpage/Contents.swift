import Foundation

// https://school.programmers.co.kr/learn/courses/30/lessons/181187

func solution(_ r1:Int, _ r2:Int) -> Int {
    var r1x: Double = pow(Double(r1), 2) // 9
    var r2x: Double = pow(Double(r2), 2) // 4
    var count: Int = 0
    
    for x in 1...r2 {
        var large: Int = Int(sqrt(r2x - Double(x) * Double(x)))
        var small: Int = 0
        if x <= r1 {
            small = Int(ceil(sqrt(r1x - Double(x) * Double(x))))
        }
        count += large - small + 1
    }
    
    return Int(count * 4)
}
