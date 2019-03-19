// 6-3 强引用循环与weak
// https://www.imooc.com/video/12661

import UIKit

class Person {
    var name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("Person", name, "is initialized")
    }
    
    // ARC Automatic Reference Count（自动引用计数） 为 0 时调用
    deinit {
        print("Person", name, "is being deinitialized!")
    }
}

class Apartment {
    let name: String
    var tenant: Person?
    
    init(name: String) {
        self.name = name
        print(name, "is initialized")
    }
    
    deinit {
        print("Apartment", name, "is being deinitialized!")
    }
}


var liuyubobobo: Person? = Person(name: "liuyubobobo")
var imoocApartment: Apartment? = Apartment(name: "imooc Apartment")

liuyubobobo?.apartment = imoocApartment
imoocApartment?.tenant = liuyubobobo

imoocApartment = nil
liuyubobobo = nil
