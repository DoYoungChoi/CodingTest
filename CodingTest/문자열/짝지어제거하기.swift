//
//  짝지어제거하기.swift
//  CodingTest
//
//  Created by dodor on 1/8/24.
//

import Foundation

func solution(_ s:String) -> Int{
    guard s.count > 1 else { return 0 }
    
    var str = s
    var offset = 0
    while !(str.isEmpty || offset == s.count-1) {
        if str.substring(at: offset) == str.substring(at: offset+1) {
            str = str.remove(from: offset, to: offset+1)
            offset = 0
        } else {
            offset += 1
        }
    }
    
    return str.isEmpty ? 1 : 0
}

extension String {
    func substring(at offset: Int) -> String {
        let sub = self[self.index(self.startIndex, offsetBy: offset)]
        return String(sub)
    }
    
    func remove(from: Int, to: Int) -> String {
        var str: String = ""
        
        for (idx, chr) in self.enumerated() {
            if idx < from || idx > to {
                str += String(chr)
            }
        }
        
        return str
    }
}
