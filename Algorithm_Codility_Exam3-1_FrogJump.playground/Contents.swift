import UIKit

/*
 Codility 문제 3번
 
 요약: X포지션에서 Y포지션까지 가기 위해 개구리가 해야되는 최소 점프수를 구하시오
 X: 개구리가 서있는 최초 포지션 X  /  Y: 개구리가 도착해야되는 포지션 Y   / D: 개구리가 한번에 뛸수있는 거리
 
 A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.
 
 Count the minimal number of jumps that the small frog must perform to reach its target.
 
 Write a function:
 
 public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int
 
 that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.
 
 For example, given:
 
 X = 10
 Y = 85
 D = 30
 the function should return 3, because the frog will be positioned as follows:
 
 after the first jump, at position 10 + 30 = 40
 after the second jump, at position 10 + 30 + 30 = 70
 after the third jump, at position 10 + 30 + 30 + 30 = 100
 Write an efficient algorithm for the following assumptions:
 
 X, Y and D are integers within the range [1..1,000,000,000];
 X ≤ Y.
 Copyright 2009–2019 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 */

func solution(_ X: Int, _ Y: Int, _ D: Int) -> Int {
    var result = 0
    guard X < Y else { print(0); return 0 }
    
    if ((Y-X) % D) == 0 {
        result = (Y-X) / D
    } else {
        result = ((Y-X) / D ) + 1
    }
    
    print(result)
    return result
}

let x = (1...1000000000).randomElement()!
let y = (1...1000000000).randomElement()!
let d = (1...1000000000).randomElement()!
print("x: ", x)
print("y: ", y)
print("d: ", d)

solution(x, y, d)
