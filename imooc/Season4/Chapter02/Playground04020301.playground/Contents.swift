// 2-3 Swift扩展标准库
// https://www.imooc.com/video/12058

import UIKit

extension Int {
    var square:Int {
        return self * self
    }
    
    var cube:Int {
        return self * self * self
    }
    
    func inRange(closedLeft left:Int, openedRight:Int) -> Bool {
        return self >= left && self < openedRight
    }
    
    // task 是一个函数
    func repetitions(task: () -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }
    
    func stride(to end:Int, by stride:Int, task:(Int) -> Void){
        for i in Swift.stride(from: self, to: end, by: stride) {
            task(i)
        }
    }
}

let num = 8
num * num
num.square
num.cube

let index = 12
index >= 0 && index < 20
index.inRange(closedLeft: 0, openedRight: 20)

//for _ in 0 ..< num {
//
//}
num.repetitions {
    print("Hello")
}

// 开区间，不包含8
for index in stride(from: 2, to: num, by: 2) {
    print(index)
}

//2
//4
//6
// 闭区间，包含8
for index in stride(from: 20, through: num, by: -3) {
    print(index)
}
//20
//17
//14
//11
//8

// 调用扩展的stride方法
num.stride(to: 2, by: -2) { index in
    print(index.square)
}
//64
//36
//16

// 12345[2]:3  找下标为2的位
// binary, hex 整数转成其他制式的数
// 5.isPrime 是否为质数

// String
// UIColor(hex: "#ffffff")
