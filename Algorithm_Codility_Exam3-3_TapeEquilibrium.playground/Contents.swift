import UIKit
/*
 Codility
 
 A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.
 
 Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
 
 The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
 
 In other words, it is the absolute difference between the sum of the first part and the sum of the second part.
 
 For example, consider array A such that:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 4
 A[4] = 3
 
 [3, 1, 2, 4, 3]
 
 We can split this tape in four places:
 
 P = 1, difference = |3 − 10| = 7
 P = 2, difference = |4 − 9| = 5
 P = 3, difference = |6 − 7| = 1
 P = 4, difference = |10 − 3| = 7
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.
 
 For example, given:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 4
 A[4] = 3
 the function should return 1, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−1,000..1,000].
 Copyright 2009–2019 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 
 */


public func solution(_ A : inout [Int]) -> Int {
    let arrayTotal = A.reduce(0, +)
    var resultArray = [Int]()
    
    for p in 1..<A.count {
        print("p값: ", p)
        var frontPartTotal = 0
        
        for arrayIndex in 0..<p {
            frontPartTotal += A[arrayIndex]
        }
        
        let result = abs( frontPartTotal - (arrayTotal - frontPartTotal) )
        print(result)
        
        if result == 0 {
            return 0
        }
//        else if resultArray.count > 0 && resultArray.last! < result {
//            return resultArray.last!
//        }
        
        resultArray.append(result)
    }
    
    return resultArray.min()!
}

public func solution2(_ A : inout [Int]) -> Int {
    let arrayTotal = A.reduce(0, +)
    var frontPartTotal = 0
    var resultArray = [Int]()
    
    for index in 0..<(A.count-1) {
        frontPartTotal += A[index]
        
        let result = abs( frontPartTotal - (arrayTotal - frontPartTotal) )
        
        if result == 0 {
            return 0
        }
//        else if resultArray.count > 0 && resultArray.last! < result {
//            return resultArray.last!
//        }
        
        resultArray.append(result)
    }
    
    return resultArray.min()!
}


var array = [3, 1, 2, 4, 3]
var array2 = [1,2,3,4,5,6,8,10]
solution2(&array)
