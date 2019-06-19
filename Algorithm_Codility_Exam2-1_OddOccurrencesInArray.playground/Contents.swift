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


public func solution(_ A : inout [Int]) -> Int {
    // 이중 for문을 돌려서 해당 element의 갯수가 홀수인지를 일일이 검사함 => 큰 배열 데이터가 들어갔을시 연산처리가 오래걸려 Fail
    var checkedValue = [Int]()
    
    for i in A {
        guard !checkedValue.contains(i) else { continue }
        var count = 0
        
        for k in A {
            if i == k { count += 1 }
        }
        
        if count % 2 == 1 { return i }
        
        checkedValue.append(i)
    }
    return 0
}

// =================================== ===================================

public func solution2(_ A : inout [Int]) -> Int {
    // 이중 for문을 피하고자 첫번째for문으로 (Key값: 해당 element + Value값: element갯수) 정보를 담고있는 Dictionary를 만듬
    // 두번째 for문에서 value가 홀수인것만을 추출해내면 훨씬 연산처리속도가 감소됨
    var arrangedDictionary = [Int: Int]()

    for i in A {
        if arrangedDictionary[i] == nil {
            arrangedDictionary[i] = 1
        } else if var value = arrangedDictionary[i] {
            value += 1
            arrangedDictionary[i] = value
        }
    }
    
    for i in arrangedDictionary {
        if i.value % 2 == 1 {
            return i.key
        }
    }
    return 0
}
var A = [9, 3, 9, 3, 9, 7, 9]

//solution(&A)
solution2(&A)
