import UIKit
/*
 Codility 문제 1번 [이진수의 BinaryGap을 구하기]
 
 요약: BinaryGap이란 => 1과 1사이에 들어가있는 0값
      BinaryGap들의 길이(갯수) 들 중에 가장 큰 값을 반환하는 함수를 작성하시오
 Ex) 숫자 9 => 이진수 1001 => BinaryGap Lenghh = 2
     숫자 529 => 이진수 1000010001 => BinaryGap Lengh = 4, 3 => 반환 4
     숫자 20 => 이진수 10100 => BinaryGap Length = 1
     (끝에 1을 다시 만나지않고 끝나기때문에 1과1사이에 있는 값만 BinaryGap으로 정의)
 
A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.

Write a function:

public func solution(_ N : Int) -> Int

that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..2,147,483,647].
Copyright 2009–2019 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
*/

func noName(_ inputNum: Int) -> Int {
    let binaryValue = String(inputNum, radix: 2)
    print(binaryValue)
    binaryValue.count
    
    var meetNumber1 = false
    var binaryGapLengthArray = [Int]()
    var count = 0
    
    for i in binaryValue {
        //    print(i)
        if meetNumber1 == false && i == "1" {
            meetNumber1 = true
        }
        
        if meetNumber1 == true && i == "0" {
            count += 1
        }
        
        if meetNumber1 == true && i == "1" {
            binaryGapLengthArray.append(count)
            count = 0
        }
    }
    print("최대 Lenght: ", binaryGapLengthArray.max() ?? 0)
    return binaryGapLengthArray.max() ?? 0
}

noName(529)
