// 4-4 泛型约束
// https://www.imooc.com/video/12069

import UIKit

protocol Record: CustomStringConvertible {
    var wins: Int { get }
    var losses: Int { get }
}

// 扩展协议(CustomStringConvertible)的属性
extension Record {
    var description: String {
        return String(format: "WINS: %d, LOSSES: %d", arguments: [wins, losses])
    }
    
    var gamePlayed: Int {
        return wins + losses
    }
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
    }
}

protocol Tieable {
    var ties: Int { get set }
}

// 大写Self代表协议类型
extension Record where Self: Tieable {
    var gamePlayed: Int {
        return wins + losses + ties
    }
    
    // 由于Tieable的算法不一样，所以需要再次计算
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
    }
}

protocol Prizable {
    func isPrizable() -> Bool
}

struct BasketballRecord: Record, Prizable {
    var wins: Int
    var losses: Int
    func isPrizable() -> Bool {
        return wins > 2
    }
}

struct BaseballRecord: Record, Prizable {
    var wins: Int
    var losses: Int
    let gamePlayed: Int = 162
    
    // 打了10场比赛，胜率大于或等于50%
    func isPrizable() -> Bool {
        return gamePlayed > 10 && winningPercent() >= 0.5
    }
}

struct FootballRecord: Record, Tieable, Prizable {
    var wins: Int
    var losses: Int
    var ties: Int
    func isPrizable() -> Bool {
        return wins > 1
    }
}

func award(one: CustomStringConvertible & Prizable) {
    if one.isPrizable() {
        print(one)
        print("Congratulation! You won a prize!")
    } else {
        print("You can not have the prize!")
    }
}

struct Student: CustomStringConvertible, Equatable, Comparable, Prizable {
    var description: String {
        return name + " Score: " + String(score)
    }
    
    var name: String
    var score: Int
    func isPrizable() -> Bool {
        return score >= 60
    }
}

func ==(s1: Student, s2: Student) -> Bool {
    return s1.score == s2.score
}

func <(s1: Student, s2: Student) -> Bool {
    return s1.score < s2.score
}

let liuyubobobo = Student(name: "liuyubobobo", score: 100)

let a = Student(name: "Alice", score: 80)
let b = Student(name: "Bob", score: 92)
let c = Student(name: "Karl", score: 85)

let students = [a, b, c, liuyubobobo]
// Protocol 'Comparable' can only be used as a generic constraint because it has Self or associated type requirements
func topOne<T: Comparable>(seq: [T]) -> T {
    assert(seq.count > 0)
    return seq.reduce(seq[0]) {
        max($0, $1)
    }
}

topOne(seq: [4, 5, 7, 2])
topOne(seq: ["Hello", "Swift"])
topOne(seq: students)

func topPrizableOne<T: Comparable & Prizable>(seq: [T]) -> T? {
    return seq.reduce(nil) { (tempTop: T?, contender: T) in
        guard contender.isPrizable() else {
            return tempTop
        }
        
        guard let tempTop = tempTop else {
            return contender
        }
        
        return max(tempTop, contender)
    }
}

topPrizableOne(seq: students)?.name

// award(one: liuyubobobo)
//liuyubobobo
//Congratulation! You won a prize!
