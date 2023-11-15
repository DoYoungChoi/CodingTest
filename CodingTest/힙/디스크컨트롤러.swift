//
//  디스크컨트롤러.swift
//  CodingTest
//
//  Created by dodor on 11/15/23.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var time: Int = 0
    var entireTimes: [Int] = []
    var jobs = jobs.sorted {
        if $0[0] < $1[0] { return true }
        if $0[0] == $1[0] && $0[1] < $1[1] { return true }
        return false
    }
    
    while !jobs.isEmpty {
        var ableJobs = jobs.filter { $0[0] <= time }
        if ableJobs.isEmpty {
            // 지금 당장 가능한 Job이 없으므로
            // 들어오는 시간이 가장 빠른 작업 중
            // 처리시간이 가장 짧은 작업 고르기
            // => jobs가 0, 1로 오름차순 정렬되어있으므로 가장 첫번째 Job 고르고 처리
            var pickJob = jobs.removeFirst()
            time = pickJob[0] + pickJob[1]
            entireTimes.append(pickJob[1])
        } else {
            // 지금 당장 가능한 Job 중 가장 빠르게 처리할 수 있는 작업 고르기
            var pickJob = ableJobs.min { $0[1] < $1[1] }!
            let pickJobIndex = jobs.firstIndex(of: pickJob)!
            jobs.remove(at: pickJobIndex)
            
            // 해결했다고 한 후에 시간 계산
            time += pickJob[1]
            entireTimes.append(time - pickJob[0])
        }
    }
    
    print(entireTimes)
    
    return entireTimes.reduce(0) { $0 + $1 } / entireTimes.count
}
