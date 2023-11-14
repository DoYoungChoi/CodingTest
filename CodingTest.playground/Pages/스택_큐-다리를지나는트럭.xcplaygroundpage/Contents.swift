//: [Previous](@previous)

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waitings = truck_weights
    var cross: [Int] = []
    var crossTime: [Int] = []
    var seconds: Int = 0
    var rest: Int = weight
    
    while !waitings.isEmpty || !cross.isEmpty {
                
        // 1초 지남
        seconds += 1
        crossTime = crossTime.map { $0 + 1 }
        if
            let first = crossTime.first,
            first > bridge_length
        {
            rest += cross.removeFirst()
            crossTime.removeFirst()
        }
        
        if
            let next = waitings.first,
               next <= rest
        {
            var truck = waitings.removeFirst()
            cross.append(truck)
               crossTime.append(1)
               rest -= truck
        }

    }
    
    return seconds
}
