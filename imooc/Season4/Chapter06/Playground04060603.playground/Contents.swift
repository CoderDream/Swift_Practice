// 6-6 Closure中的强引用循环问题
// https://www.imooc.com/video/12665

import UIKit

class ScoreBook {
    var scores: [Int]
    
    // 在类中声明闭包，该闭包没有包含对类的引用，所以没有形成强引用
    var printTitle: () -> () = {
        print("== SCORE BOOK ==")
    }
    
    init(scores: [Int]) {
        self.scores = scores
        print("ScoreBook is initialized")
    }
    
    func printScore() {
        scores.map({ score in
            print("== \(score) ==")
        })
    }
    
    deinit {
        print("ScoreBook is being deinitialized")
    }
}

let scores: [Int] = [99, 85, 67,13,94]

var scoreBook: ScoreBook? = ScoreBook(scores: scores)
scoreBook?.printTitle()
scoreBook?.printScore()
scoreBook = nil
//ScoreBook is initialized
//== SCORE BOOK ==
//    == 99 ==
//    == 85 ==
//    == 67 ==
//    == 13 ==
//    == 94 ==
//    ScoreBook is being deinitialized
