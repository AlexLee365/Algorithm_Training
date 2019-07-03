import UIKit

/*
 
 
 스킬트리
 문제 설명
 선행 스킬이란 어떤 스킬을 배우기 전에 먼저 배워야 하는 스킬을 뜻합니다.
 
 예를 들어 선행 스킬 순서가 스파크 → 라이트닝 볼트 → 썬더일때, 썬더를 배우려면 먼저 라이트닝 볼트를 배워야 하고, 라이트닝 볼트를 배우려면 먼저 스파크를 배워야 합니다.
 
 위 순서에 없는 다른 스킬(힐링 등)은 순서에 상관없이 배울 수 있습니다. 따라서 스파크 → 힐링 → 라이트닝 볼트 → 썬더와 같은 스킬트리는 가능하지만, 썬더 → 스파크나 라이트닝 볼트 → 스파크 → 힐링 → 썬더와 같은 스킬트리는 불가능합니다.
 
 선행 스킬 순서 skill과 유저들이 만든 스킬트리1를 담은 배열 skill_trees가 매개변수로 주어질 때, 가능한 스킬트리 개수를 return 하는 solution 함수를 작성해주세요.
 
 제한 조건
 스킬은 알파벳 대문자로 표기하며, 모든 문자열은 알파벳 대문자로만 이루어져 있습니다.
 스킬 순서와 스킬트리는 문자열로 표기합니다.
 예를 들어, C → B → D 라면 CBD로 표기합니다
 선행 스킬 순서 skill의 길이는 2 이상 26 이하이며, 스킬은 중복해 주어지지 않습니다.
 skill_trees는 길이 1 이상 20 이하인 배열입니다.
 skill_trees의 원소는 스킬을 나타내는 문자열입니다.
 skill_trees의 원소는 길이가 2 이상 26 이하인 문자열이며, 스킬이 중복해 주어지지 않습니다.
 입출력 예
 skill    skill_trees    return
 CBD    [BACDE, CBADF, AECB, BDA]    2
 입출력 예 설명
 BACDE: B 스킬을 배우기 전에 C 스킬을 먼저 배워야 합니다. 불가능한 스킬트립니다.
 CBADF: 가능한 스킬트리입니다.
 AECB: 가능한 스킬트리입니다.
 BDA: B 스킬을 배우기 전에 C 스킬을 먼저 배워야 합니다. 불가능한 스킬트리입니다.
 
*/

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    guard skill.count >= 2 && skill.count <= 26 else { return 0 } // 추가
    
    let skill = skill.uppercased()
    
    var availableSkillTrees = [String]()
    var skillDic = [String: Int]()    // (스킬우선순위, 스킬Value)
    
    for i in skill.enumerated() { skillDic.updateValue(i.offset, forKey: String(i.element)) }
    
    for arrayValue in skill_trees {
        print("--------------------------[현재 \(arrayValue) 검사중]--------------------------")
        guard arrayValue.count >= 2 && arrayValue.count <= 26 else { print("2개 이상의 스킬이어야합니다"); continue } // 추가
        
        var isCorrectSkillTree = true
        
        var currentSkillPriority: Int?
        for eachCharacter in arrayValue {
            print("* 현재 문자: \(eachCharacter)")
            
            if skill.contains(eachCharacter) {
                let priorityInFor = skillDic[String(eachCharacter)]!    // 현재 문자의 스킬 우선순위
                print("현재 \(eachCharacter) 문자는 포함된 문자입니다. 스킬 우선순위는 \(priorityInFor)")
                
                if (currentSkillPriority == nil) && priorityInFor != 0 {
                    print("currentSKillPriority가 nill => 선행되어야되는 스킬이 있습니다")
                    isCorrectSkillTree = false
                    break
                    
                } else if currentSkillPriority == nil && priorityInFor == 0 {
                    currentSkillPriority = 0
                    
                } else if priorityInFor != currentSkillPriority! + 1 {
                    isCorrectSkillTree = false
                    print("현재 문자: \(eachCharacter), 우선순위: \(priorityInFor) 이전에 먼저 선행되어야하는 스킬이있습니다.")
                    break
                }
                
                
                currentSkillPriority = priorityInFor
                print("현재 마지막 스킬 우선순위: \(currentSkillPriority!)")
            }
        }
        
        if isCorrectSkillTree {
            availableSkillTrees.append(arrayValue)
            print("가능한 스킬트리입니다")
        } else {
            print("불가능한 스킬트리입니다")
            continue
        }
        
    }
    
    return availableSkillTrees.count
}

let array = ["BACDE", "CBADF", "AECB", "BDA", "CDBA", "D", "C", "", "AFR", "CD"]

let array2 = ["ASFEF", "QJDCXV", "CWJKLO", "CJKIBDO"]

//solution("CBD", array)
//"SBAKL", ["SBERTL"]

solution("SBAKL", ["SBERTL"])




let a = "CBD"





func solution2(_ skill:String, _ skill_trees:[String]) -> Int {
    var skillPrioirtyArray = [String]()
    
    for i in skill { skillPrioirtyArray.append(String(i)) }
    
    print(skillPrioirtyArray)
    
    
    
    
    
    
    return 0
}

solution2("SBAKL", ["SBERTL"])

func checkWheterSkillTreeIsCorrect(_ skill: String) -> Bool {
    
    
    
    return true
}

