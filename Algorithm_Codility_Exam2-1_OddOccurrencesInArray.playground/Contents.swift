import UIKit

/*
 Codility 문제 2-1번
 
 요약: Int배열에서 같은 숫자끼리 한쌍으로(2개씩) 묶어서 혼자인 숫자 리턴하기
      가장 효율적인 알고리즘을 구성하시오
      - 배열 안의 구성요소 갯수 => 범위 [1..1,000,000] 안의 홀수 갯수
      - 배열 안의 숫자의 범위 => 범위 [1..1,000,000,000] 안의 정수
 Ex) [9, 3, 9, 3, 9, 7, 9]  => 한쌍(9, 9), (3, 3), (9, 9)  => 7 짝 X => 7 리턴
 
 
 A non-empty array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.
 
 For example, in array A such that:
 
 A[0] = 9  A[1] = 3  A[2] = 9
 A[3] = 3  A[4] = 9  A[5] = 7
 A[6] = 9
 the elements at indexes 0 and 2 have value 9,
 the elements at indexes 1 and 3 have value 3,
 the elements at indexes 4 and 6 have value 9,
 the element at index 5 has value 7 and is unpaired.
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.
 
 For example, given array A such that:
 
 A[0] = 9  A[1] = 3  A[2] = 9
 A[3] = 3  A[4] = 9  A[5] = 7
 A[6] = 9
 the function should return 7, as explained in the example above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an odd integer within the range [1..1,000,000];
 each element of array A is an integer within the range [1..1,000,000,000];
 all but one of the values in A occur an even number of times.
 Copyright 2009–2019 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 
 */


public func solution() -> Int {
    var A = [9, 3, 9, 3, 9, 7, 9]
    var result = 0
    
    for i in A {
        var count = 0
        print("i: ", i)
        
        for k in A {
            if i == k {
              count += 1
            print("count: ", count)
            }
        }
        
        if count % 2 == 1 {
            result = i
            print("result: ", result)
        }
    }
    
    return result
}
solution()
