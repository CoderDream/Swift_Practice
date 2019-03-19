// 6-4 unowned
// https://www.imooc.com/video/12662

import UIKit

class Person {
    var name: String
    var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
        print("Person", name, "is initialized")
    }
    
    // ARC Automatic Reference Count（自动引用计数） 为 0 时调用
    deinit {
        print("Person", name, "is being deinitialized!")
    }
}


class CreditCard {
    let number: String
    
    // 不是可选型，非空
    unowned let customer: Person
    
    init(number: String, customer: Person) {
        self.number = number
        self.customer = customer
        print("Credit Card", number, "is initialized!")
    }
    
    deinit {
        print("Credit Card", number, "is being deinitialized!")
    }
}

var liuyubobobo: Person? = Person(name: "liuyubobobo")
var goldenCard: CreditCard? = CreditCard(number: "12345678", customer: liuyubobobo!)

liuyubobobo?.creditCard = goldenCard

//liuyubobobo = nil
// goldenCard?.customer // error: Execution was interrupted, reason: signal SIGABRT.
//goldenCard = nil

//=====
goldenCard = nil
liuyubobobo = nil // nil
goldenCard?.customer
//Person liuyubobobo is initialized
//Credit Card 12345678 is initialized!
//Person liuyubobobo is being deinitialized!
//Credit Card 12345678 is being deinitialized!
