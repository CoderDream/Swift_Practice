// 3-4 类型别名(typealias) 和关联类型 (associatedtype)
// https://www.imooc.com/learn/677
import UIKit

protocol WeightCalculable {
    
    associatedtype WeightType
    var weight: WeightType { get }
    // var weight: Int { get }
}

class iPhone7: WeightCalculable {
    typealias WeightType = Double
    
    var weight: WeightType {
        return 0.114
    }
}

class Ship: WeightCalculable {
    typealias WeightType = Int
    
    let weight: WeightType
    
    init(weight: Int) {
        self.weight = weight
    }
}

extension Int {
    typealias Weight = Int
    var t: Weight { return 1_000 * self }
}

let titanic = Ship(weight: 46_328.t)
