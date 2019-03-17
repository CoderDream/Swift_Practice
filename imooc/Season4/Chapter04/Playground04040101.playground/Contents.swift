// 4-1 Swift扩展协议和默认实现
// https://www.imooc.com/video/12066

import UIKit

protocol Record: CustomStringConvertible {
    var wins: Int { get }
    var losses: Int { get }
    func winningPercent() -> Double
}


