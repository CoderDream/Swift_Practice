// 4-1 Swift扩展协议和默认实现
// https://www.imooc.com/video/12066

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
    
    func shoutWins() {
        print("WE WINS ", wins, " TIMES")
    }
    
    var gamePlayed: Int {
        return wins + losses
    }
}

struct BasketballRecord: Record {
    var wins: Int
    
    var losses: Int
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
//        return Double(wins) / Double(wins + losses)
    }

}

struct BaseballRecord: Record {
    var wins: Int
    
    var losses: Int
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
        //        return Double(wins) / Double(wins + losses)
    }
}

let teamRecord = BasketballRecord(wins: 2, losses: 10)
print(teamRecord)
// WINS: 2, LOSSES: 10
teamRecord.shoutWins()

// 扩展系统的协议
extension CustomStringConvertible {
    var descriptionWithDate: String {
        return NSDate().description + " " + description
    }
}
print(teamRecord.descriptionWithDate)
// 2019-03-18 01:05:59 +0000 WINS: 2, LOSSES: 10
