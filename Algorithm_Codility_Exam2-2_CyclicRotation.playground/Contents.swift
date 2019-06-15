import UIKit


/*
 Codility 2-2번
 
 요약: 순환하는 배열을 만드시오
 A: Int배열 / K: 순환횟수
 
 Ex) A = [3, 8, 9, 7, 6] / K = 3
 => [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
    [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
    [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 
 An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
 
 The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.
 
 Write a function:
 
 public func solution(_ A : inout [Int], _ K : Int) -> [Int]
 
 that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.
 
 For example, given
 
 A = [3, 8, 9, 7, 6]
 K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:
 
 [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
 [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
 [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 For another example, given
 
 A = [0, 0, 0]
 K = 1
 the function should return [0, 0, 0]
 
 Given
 
 A = [1, 2, 3, 4]
 K = 4
 the function should return [1, 2, 3, 4]
 
 Assume that:
 
 N and K are integers within the range [0..100];
 each element of array A is an integer within the range [−1,000..1,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
 
 Copyright 2009–2019 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 */

public func solution (_ A: inout [Int], _ K: Int) -> [Int] {
    guard A != [] || K != 0 else { return A }
    
    var lastValue = 0
    for _ in 1...K {
        lastValue = A.last ?? 0
        A.removeLast()
        A.insert(lastValue, at: 0)
        print(A)
    }
    return A
}
var a = [3, 8, 9, 7, 6]
solution(&a, 3)


