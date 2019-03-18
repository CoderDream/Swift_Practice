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

//Welcome to Roll Number Game.
//Try to use least turn to make total 100 scores!
//ROUND 0 :
//You rolled a  1  ! The score is  1  now!
//ROUND 1 :
//You rolled a  3  ! The score is  4  now!
//ROUND 2 :
//You rolled a  1  ! The score is  5  now!
//ROUND 3 :
//You rolled a  3  ! The score is  8  now!
//ROUND 4 :
//You rolled a  4  ! The score is  12  now!
//ROUND 5 :
//You rolled a  3  ! The score is  15  now!
//ROUND 6 :
//You rolled a  2  ! The score is  17  now!
//ROUND 7 :
//You rolled a  6  ! The score is  23  now!
//ROUND 8 :
//You rolled a  6  ! The score is  29  now!
//ROUND 9 :
//You rolled a  3  ! The score is  32  now!
//ROUND 10 :
//You rolled a  6  ! The score is  38  now!
//ROUND 11 :
//You rolled a  5  ! The score is  43  now!
//ROUND 12 :
//You rolled a  1  ! The score is  44  now!
//ROUND 13 :
//You rolled a  6  ! The score is  50  now!
//ROUND 14 :
//You rolled a  3  ! The score is  53  now!
//ROUND 15 :
//You rolled a  4  ! The score is  57  now!
//ROUND 16 :
//You rolled a  6  ! The score is  63  now!
//ROUND 17 :
//You rolled a  1  ! The score is  64  now!
//ROUND 18 :
//You rolled a  5  ! The score is  69  now!
//ROUND 19 :
//You rolled a  3  ! The score is  72  now!
//ROUND 20 :
//You rolled a  3  ! The score is  75  now!
//ROUND 21 :
//You rolled a  6  ! The score is  81  now!
//ROUND 22 :
//You rolled a  1  ! The score is  82  now!
//ROUND 23 :
//You rolled a  4  ! The score is  86  now!
//ROUND 24 :
//You rolled a  2  ! The score is  88  now!
//ROUND 25 :
//You rolled a  4  ! The score is  92  now!
//ROUND 26 :
//You rolled a  6  ! The score is  98  now!
//ROUND 27 :
//You rolled a  2  ! The score is  100  now!
//Congratulation! You win the game in  28  ROUND!
//== Rock Paper Scissor ==
//ROUND 0 :
//Your:  Paper
//Other:  Rock
//You win this round
//ROUND 1 :
//Your:  Scissors
//Other:  Scissors
//You didn't win
//ROUND 2 :
//Your:  Scissors
//Other:  Paper
//You win this round
//You win!
