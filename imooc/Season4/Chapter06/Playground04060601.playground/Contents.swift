// 6-6 Closure中的强引用循环问题
// https://www.imooc.com/video/12665

import UIKit

class SmartAirConditioner {
    var temperature: Int = 26
    // 函数类型的变量（强引用循环）
    var temperatureChange: ((Int) -> ())!
    
    init() {
        temperatureChange = { newTemprature in
            // 使用了self
            if abs(newTemprature - self.temperature) >= 10 {
                print("It's not healthy to do it!")
            }
            else {
                self.temperature = newTemprature
                print("New temperature \(self.temperature) is set!")
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

airCon?.temperatureChange = { newTemprature in
    if newTemprature >= 10 && newTemprature <= 26 {
        airCon?.temperature = newTemprature
        print("New temperature \(newTemprature) is set!")
        print("It's not healthy to do it!")
    }
    else {
        print("\(newTemprature) is not a good temperature!")
    }
}

airCon?.temperatureChange(12)
airCon = nil
//It's not healthy to do it!
//New temperature 24 is set!
//New temperature 12 is set!
//It's not healthy to do it!
//Smart Air-Conditioner is being deinitialiezed!
