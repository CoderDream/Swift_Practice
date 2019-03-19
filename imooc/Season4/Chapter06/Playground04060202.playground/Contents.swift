// 6-2 引用计数
// https://www.imooc.com/video/12660

import UIKit

class Person {
    var name: String
    init(name: String) {
        self.name = name
        print("Person", name, "is initialized")
    }
    
    // ARC Automatic Reference Count（自动引用计数） 为 0 时调用
    deinit {
        print("Person", name, "is deinitialized!")
    }
}

var person1: Person? = Person(name: "liuyubobobo")
var person2 = person1
var person3 = person2

person1 = nil
person2 = nil
person3 = nil
//Person liuyubobobo is initialized
//Person liuyubobobo is deinitialized!
