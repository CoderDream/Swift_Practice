// 6-7 闭包捕获列表
// https://www.imooc.com/video/12666

import UIKit

class SmartAirConditioner {
    var temperature: Int = 26
    // 函数类型的变量（强引用循环）不能声明为弱引用
    var temperatureChange: ((Int) -> ())!
    
    init() {
        // []代表捕获列表 如果用weak，必须解包，强制！解包或者
        // unowned
        // `self`
        temperatureChange = { [weak self] newTemprature in
            // 使用了self 或者 delegate 会产生 强引用循环
            // 解包
            if let weakSelf = self {
                if abs(newTemprature - weakSelf.temperature) >= 10 {
                    print("It's not healthy to do it!")
                }
                else {
                    weakSelf.temperature = newTemprature
                    print("New temperature \(weakSelf.temperature) is set!")
                }
            }
        }
    }
    
    deinit {
        print("Smart Air-Conditioner is being deinitialized!")
    }
}

var airCon: SmartAirConditioner? = SmartAirConditioner()
airCon?.temperature
airCon?.temperatureChange(100)
airCon?.temperatureChange(24)

airCon = nil
//It's not healthy to do it!
//New temperature 24 is set!
//Smart Air-Conditioner is being deinitialiezed!
