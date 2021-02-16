//
//  main.swift
//  Narcissistic
//
//  Created by Zachary Fertig on 2/16/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

func power(num:Int, pow:Int) -> Int {
    var result = num
    
    if pow == 0 {
        result = 1
    }
    else if pow == 1 {
        result = num
    }
    else {
        for _ in 1...pow-1 {
            result *= num
        }
    }
    
    return result
}

func narcissistic(min:Int, max:Int) -> [Int] {
    
    var result = [Int]()
    
    for x in min...max {
        
        var i = x
        var numDigits = 0
        
        while i != 0 {
            i = i / 10
            numDigits += 1
        }
        
        i = x
        var total = 0
        for _ in 1...numDigits{
            total += power(num: i % 10, pow: numDigits)
            i /= 10
        }
        
        if total == x {
            result.append(x)
        }
        
    }
    
    return result
}

let nNumbers = narcissistic(min: 10, max: 1000)

print(nNumbers)
