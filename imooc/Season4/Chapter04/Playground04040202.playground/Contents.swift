// 4-2 Swift面向协议编程
// https://www.imooc.com/video/12067

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

struct BasketballRecord: Record {
    var wins: Int
    var losses: Int
    let gamePlayed: Int = 162
}

struct BaseballRecord: Record {
    var wins: Int
    var losses: Int
}

struct FootballRecord: Record, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}

let basketballTeamRecord = BasketballRecord(wins: 2, losses: 10)
let baseballTeamRecord = BaseballRecord(wins: 10, losses: 5)
print(basketballTeamRecord.gamePlayed)
print(baseballTeamRecord.gamePlayed)
// WINS: 2, LOSSES: 10

let footballTeamRecord = FootballRecord(wins: 1, losses: 1, ties: 1)
print(footballTeamRecord.gamePlayed)
print(footballTeamRecord.winningPercent())

//162
//15
//3
//0.3333333333333333
