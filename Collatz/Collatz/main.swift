//
//  main.swift
//  Collatz
//
//  Created by Zachary Fertig on 2/16/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

func collatz(n:Int) -> Int {
    
    var count = 0
    var num = n
    
    while n != 1 {
        if n % 2 == 0 {
            num = num / 2
        } else {
            num = 3 * num + 1
        }
        count += 1
    }
    
    return count
}

let number = 12

var ans = collatz(n: number)

print("collatz(\(number)) = \(ans)")
