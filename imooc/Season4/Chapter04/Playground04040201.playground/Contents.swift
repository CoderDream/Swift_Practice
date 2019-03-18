// 4-2 Swift面向协议编程
// https://www.imooc.com/video/12067

import UIKit

protocol Record: CustomStringConvertible {
    var wins: Int { get }
    var losses: Int { get }
    func winningPercent() -> Double
}

// 扩展协议(CustomStringConvertible)的属性
extension Record {
    var description: String {
        return String(format: "WINS: %d, LOSSES: %d", arguments: [wins, losses])
    }
    
    var gamePlayed: Int {
        return wins + losses
    }
}

struct BasketballRecord: Record {
    var wins: Int
    var losses: Int
    let gamePlayed: Int = 162
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
    }
}

struct BaseballRecord: Record {
    var wins: Int
    var losses: Int
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
    }
}

struct FootballRecord: Record {
    var wins: Int
    var losses: Int
    var ties: Int
    
    var gamePlayed: Int {
        return wins + losses + ties
    }
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
    }
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
