//
//  모음사전.swift
//  CodingTest
//
//  Created by dodor on 11/16/23.
//

import Foundation

func solution(_ word:String) -> Int {
    var order: Int = 0
    var result: Int = 0
    
    findOrder(
        word: word,
        currentWord: "",
        level: 0,
        order: &order,
        result: &result
    )
    
    return result
}

func findOrder(
    word: String,
    currentWord: String,
    level: Int,
    order: inout Int,
    result: inout Int
) {
    if level == 5 || result != 0 { return }
    
    let vowels = ["A", "E", "I", "O", "U"]
    for vowel in vowels {
        order += 1
        if word == currentWord + vowel {
            result = order
            return
        } else {
            findOrder(
                word: word,
                currentWord: currentWord + vowel,
                level: level + 1,
                order: &order,
                result: &result
            )
        }
    }
}
