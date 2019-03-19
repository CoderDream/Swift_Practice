// 7-4 NSObject, AnyObject 和 Any
// https://www.imooc.com/video/12670

import UIKit

var objects: NSArray = [
    CGFloat(3.1415926),
    "imooc",
    UIColor.blue,
    NSDate(),
    Int(32),
    Array<Int>([1, 2, 3])
]


class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var objects3 = [
    CGFloat(3.1415926),
    "imooc",
    UIColor.blue,
    NSDate(),
    Int(32),
    Array<Int>([1, 2, 3]),
    Person(name: "liuyubobobo")
    ] as [AnyObject]

let a = objects3[0] // AnyObject

// Argument type '(Int) -> Int' does not conform to expected type 'AnyObject'
//objects3.append({ (a: Int) -> Int in
//    return a * a
//})

var objects4: [Any] = [
    CGFloat(3.1415926),
    "imooc",
    UIColor.blue,
    NSDate(),
    Int(32),
    Array<Int>([1, 2, 3]),
    Person(name: "liuyubobobo")
    ]

let b = objects4[0] // Any

objects4.append({ (a: Int) -> Int in
    return a * a
})
