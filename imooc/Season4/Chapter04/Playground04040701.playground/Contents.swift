// 4-7 创建自己的委托模式
// https://www.imooc.com/video/12072

import UIKit

protocol TurnBasedGame {
    var turn: Int { get set }
    func play()
}

protocol TurnBasedGameDelegate {
    func gameStart()
    func playerMove()
    func gameEnd()
    func gameOver() -> Bool
}

class SinglePlayerTurnBasedGame: TurnBasedGame {
    var turn = 0
    var delegate:TurnBasedGameDelegate!
    func play() {
        delegate.gameStart()
        while !delegate.gameOver() {
            print("ROUND", turn, ":")
            delegate.playerMove()
            turn += 1
        }
        delegate.gameEnd()
    }
}

class RollNumberGame: SinglePlayerTurnBasedGame, TurnBasedGameDelegate {
    
    var score = 0
    
    override init() {
        super.init()
        delegate = self
    }
    
    func gameStart() {
        score = 0
        turn = 0
        
        print("Welcome to Roll Number Game.")
        print("Try to use least turn to make total 100 scores!")
    }
    
    func playerMove() {
        let rollNumber = Int(arc4random()) % 6 + 1
        score += rollNumber
        print("You rolled a ", rollNumber, " ! The score is ", score, " now!")
    }
    
    func gameEnd() {
        print("Congratulation! You win the game in ", turn, " ROUND!")
    }
    
    func gameOver() -> Bool {
        return score >= 100
    }
}

let rollNumberGame = RollNumberGame()
rollNumberGame.play()

// 石头剪刀布
class RockPaperScissors: SinglePlayerTurnBasedGame, TurnBasedGameDelegate {
    
    enum Shape: Int {
        case Rock
        case Scissors
        case Paper
        func beat(shape: Shape) -> Bool {
            return (self.rawValue + 1) % 3 == shape.rawValue
        }
    }
    
    var wins = 0
    
    override init() {
        super.init()
        delegate = self
    }
    
    static func go() -> Shape {
        return Shape(rawValue: Int(arc4random()) % 3)!
    }
    
    func show(hand: Shape) -> String {
        switch hand {
        case .Paper:    return "Paper"
        case .Rock:    return "Rock"
        case .Scissors:    return "Scissors"
        }
    }
    
    func gameStart() {
        wins = 0
        print("== Rock Paper Scissor ==")
    }
    
    func playerMove() {
        let yourShape = RockPaperScissors.go()
        let otherShape = RockPaperScissors.go()
        print("Your: ", show(hand: yourShape))
        print("Other: ", show(hand: otherShape))
        
        if yourShape.beat(shape: otherShape) {
            print("You win this round")
            wins += 1
        }
        else {
            print("You didn't win")
        }
    }
    
    func gameEnd() {
        if wins >= 2 {
            print("You win!")
        }
        else {
            print("You lose...")
        }
    }
    
    func gameOver() -> Bool {
        return turn >= 3
    }
}

let rockPaperScissors = RockPaperScissors()
rockPaperScissors.play()
