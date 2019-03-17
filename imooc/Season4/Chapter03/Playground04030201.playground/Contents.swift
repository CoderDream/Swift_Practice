// 3-2 Swift协议和构造函数
// https://www.imooc.com/video/12062

import UIKit

protocol Pet {
    var name:String {get set}
    init(name:String)
    func playWith()
    func fed()
}

class Animal {
    var type:String = "mammal"
}

// 继承类（放在前面），实现协议
class Dog:Animal, Pet {
    var name: String = "Puppy"
    
    // 子类必须实现该初始化方法，如果class是final的，则不需要required关键字
    required init(name: String) {
        self.name = name
    }
    
    func playWith() {
        print("Wong!")
    }
    
    func fed() {
        print("I want a bone")
    }
    
}

class Bird:Animal {
    var name:String = "Little Little Bird"
    
    required init(name:String) {
        self.name = name
    }
}

class Parrot:Bird, Pet {
    
    required init(name:String) {
        super.init(name:name + " " + name)
    }
    
    func playWith() {
        print("Hello")
    }
    
    func fed() {
        print("Thank you")
    }
}
