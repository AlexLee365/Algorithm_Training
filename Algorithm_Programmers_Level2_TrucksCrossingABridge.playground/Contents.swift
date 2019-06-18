import UIKit


/*
 프로그래머스 코딩테스트연습 Level 2  다리를 지나는 트럭
 
 문제 설명
 트럭 여러 대가 강을 가로지르는 일 차선 다리를 정해진 순으로 건너려 합니다. 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내야 합니다. 트럭은 1초에 1만큼 움직이며, 다리 길이는 bridge_length이고 다리는 무게 weight까지 견딥니다.
 ※ 트럭이 다리에 완전히 오르지 않은 경우, 이 트럭의 무게는 고려하지 않습니다.
 
 예를 들어, 길이가 2이고 10kg 무게를 견디는 다리가 있습니다. 무게가 [7, 4, 5, 6]kg인 트럭이 순서대로 최단 시간 안에 다리를 건너려면 다음과 같이 건너야 합니다.
 
 경과 시간  다리를 지난 트럭   다리를 건너는 트럭    대기 트럭
   0          []             []         [7,4,5,6]
  1~2         []             [7]         [4,5,6]
   3          [7]            [4]          [5,6]
   4          [7]           [4,5]          [6]
   5         [7,4]           [5]           [6]
  6~7       [7,4,5]          [6]           []
   8       [7,4,5,6]         []            []
 따라서, 모든 트럭이 다리를 지나려면 최소 8초가 걸립니다.
 
 solution 함수의 매개변수로 다리 길이 bridgelength, 다리가 견딜 수 있는 무게 weight, 트럭별 무게 truckweights가 주어집니다. 이때 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 return 하도록 solution 함수를 완성하세요.
 
 제한 조건
 bridge_length는 1 이상 10,000 이하입니다.
 weight는 1 이상 10,000 이하입니다.
 truck_weights의 길이는 1 이상 10,000 이하입니다.
 모든 트럭의 무게는 1 이상 weight 이하입니다.
 입출력 예
 bridge_length    weight    truck_weights    return
 2    10    [7,4,5,6]    8
 100    100    [10]    101
 100    100    [10,10,10,10,10,10,10,10,10,10]    110
 출처
 
 */

func getTimeAllTrucksPassed(_ bridgeLength: Int, _ bridgeWeight: Int, _ truckWeights: [Int]) -> Int {
    var readyTrucks = truckWeights
    var passingTrucks = [(Int, Int)]()  // ( 트럭무게(트럭넘버), 다리를 지나는 시간(초) )
    var passedTrucks = [Int]()
    
    var seconds = 0
    
    for i in 1...((bridgeLength+1) * truckWeights.count) {
        seconds += 1
        
        var passedTrucksNumber = 0
        for i in 0..<passingTrucks.count {
            passingTrucks[i].1 += 1     // 현재 지나고있는 트럭들의 지나는 시간 + 1
            if passingTrucks[i].1 == bridgeLength {    // 지나고있는 트럭의 시간이 2초로 다차면 다리를건넌트럭배열로 이동
//                passingTrucks.remove(at: i)
                passedTrucks.append(passingTrucks[i].0)
                passedTrucksNumber += 1
            }
        }
        
        if passedTrucksNumber != 0 {
            passingTrucks.removeFirst(passedTrucksNumber)  // 지나간 트럭수 만큼 지나가고있는 트럭배열에서 제거
        }
        
        if passedTrucks == truckWeights {
            print("--------------------------[모든트럭이 다 지나감]--------------------------")
            print("readyTrucks: ", readyTrucks ," / passingTrucks: ", passingTrucks, " / passedTrucks: ", passedTrucks, " / seconds: ", seconds )
            return seconds
        }
        
        guard readyTrucks.count != 0 else { continue }  // 대기중인 트럭이 다넘어왔으면 밑 코드 (대기중인트럭 => 지나고있는 트럭) 를 실행하지않음
        
        let passingTrucksTotalWeight = ( passingTrucks.map{ $0.0 }.reduce(0){ $0 + $1 } ) + readyTrucks.first!
        // 현재 다리에 있는 트럭들의 무게 + 대기트럭 첫번째트럭 무게
        
        if passingTrucksTotalWeight <= bridgeWeight {   // 토탈트럭무게가 다리 무게를 넘지않으면
            passingTrucks.append((readyTrucks.first!, 0))
            readyTrucks.removeFirst()       // 대기중인트럭 => 지나고있는 트럭
        }
        print("readyTrucks: ", readyTrucks ," / passingTrucks: ", passingTrucks, " / passedTrucks: ", passedTrucks, " / seconds: ", seconds )
        
    }
    
    print("에러")
    return 0
}

//getTimeAllTrucksPassed(2, 10, [7,4,5,6])
//getTimeAllTrucksPassed( 5, 10, [7,4,6,2,1] )
//getTimeAllTrucksPassed(100, 100, [10])
getTimeAllTrucksPassed(100, 100, [10,10,10,10,10,10,10,10,10,10])




