// 6-1 deinit
// https://www.imooc.com/video/12660

import UIKit

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
        print(name, "is coming. ")
    }
    
    func doSomething() {
        print(name, "is doing something.")
    }
    
    deinit {
        print(name, "is leaving!")
    }
}

var liuyubobobo: Person? = Person(name: "liuyubobobo")
liuyubobobo = nil

// 函数体就是一个作用域
func inTheShop() {
    print("===================")
    print("Welcome")
    
    // let 在作用域的最后也会deinit
    let liuyubobobo: Person? = Person(name: "liuyubobobo")
    liuyubobobo?.doSomething()
}

inTheShop()

func inTheAppleShop() {
    print("===================")
    print("Welcome to the Apple Store!")
    
    for i in 0 ... 10 {
        print("Time: ", i)
        // let 在作用域的最后也会deinit
        let liuyubobobo: Person = Person(name: "liuyubobobo")
        liuyubobobo.doSomething()
    }
}

inTheAppleShop()

//liuyubobobo  is coming.
//liuyubobobo  is leaving!
//    ===================
//Welcome
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//    ===================
//Welcome to the Apple Store!
//Time:  0
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  1
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  2
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  3
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  4
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  5
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  6
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  7
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  8
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  9
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
//Time:  10
//liuyubobobo  is coming.
//liuyubobobo  is doing something.
//liuyubobobo  is leaving!
