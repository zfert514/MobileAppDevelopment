//
//  main.swift
//  Sieve
//
//  Created by Zachary Fertig on 2/16/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

func sieve(max:Int) -> [Int] {
    
    var isPrime = Array(repeating: true, count: max + 1)
    
    isPrime[0] = false
    isPrime[1] = false
    
    var result = [Int]()
    
    for i in 2...max {
        if isPrime[i] {
            //this is a prime number
            result.append(i)
            
            //mark out all multipbles of i
            var multiple = i * 2
            while multiple <= max {
                isPrime[multiple] = false
                multiple += i
            }
        }
    }
    
    return result
}

let ans = sieve(max: 100)

print(ans)
