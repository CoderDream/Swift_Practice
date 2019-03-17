// 3-5 Swift标准库中的常用协议
// https://www.imooc.com/qadetail/204503

import UIKit

struct Record: Equatable, Comparable, CustomStringConvertible {
    var wins: Int
    var losses: Int
    
    var description: String {
        return "WINS: " + String(wins) + " , LOSSES: " + String(losses)
    }
    
    var boolValue: Bool {
        return wins > losses
    }
}

func == (left: Record, right: Record) -> Bool {
    return left.wins == right.wins && left.losses == right.losses
}

func < (left: Record, right: Record) -> Bool {
    if left.wins != right.wins {
        return left.wins < right.wins
    }
    
    return left.losses > right.losses
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

recordA != recordB
recordA > recordB
recordA >= recordB

var team1Record = Record(wins: 10, losses: 3)
var team2Record = Record(wins: 8, losses: 3)
var team3Record = Record(wins: 8, losses: 5)
var records = [team1Record, team2Record, team3Record]

records.sort()
print(recordA)

if recordA.boolValue {
    print("Great")
}

extension Int {
    public var boolValue: Bool {
        return self != 0
    }
}

var wins = 0
if !wins.boolValue {
    print("You never win!")
}

//WINS: 10 , LOSSES: 5
//Great
//You never win
