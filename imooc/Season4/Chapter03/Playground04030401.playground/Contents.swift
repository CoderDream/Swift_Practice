// 3-4 类型别名(typealias) 和关联类型 (associatedtype)
// https://www.imooc.com/video/12064

import UIKit

typealias Length = Double

extension Double {
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100 }
    var ft: Double { return self / 3.28084}
}

let runningDistance: Length = 3.54.km
runningDistance

typealias AudioSample = UInt64
