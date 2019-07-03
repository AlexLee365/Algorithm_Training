import UIKit

/*
 Codility 문제 3-2
 
 요약: 빠진 배열요소를 찾아라
      배열 A = N개의 서로 다른 정수로 구성됨
      배열 A의 elements = (1...N+1) 범위의 정수들   =>  이건 배열 A가 한개의 요소를 빠뜨리고있다는것을 의미 (1부터 N+1까지 범위의 정수들 중에 1개를 빠뜨림)
 Ex) A[0] = 2
     A[1] = 3
     A[2] = 1
     A[3] = 5
 => 빠진 배열요소 = 4
 
 가장 효율적인 알고리즘을 구하시오
 
 
An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

Your goal is to find that missing element.

Write a function:

class Solution { public int solution(int[] A); }

that, given an array A, returns the value of the missing element.

For example, given array A such that:

A[0] = 2
A[1] = 3
A[2] = 1
A[3] = 5
the function should return 4, as it is the missing element.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..100,000];
the elements of A are all distinct;
each element of array A is an integer within the range [1..(N + 1)].
Copyright 2009–2019 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
*/


public func solution(_ A : inout [Int]) -> Int {
    let currentArraySumValue = A.reduce(0, +)
    let originArraySumValue = (1...A.count+1).reduce(0, +)
    let result = originArraySumValue - currentArraySumValue
    
    return result
}

var array = [2, 3, 1, 5]
solution(&array)


