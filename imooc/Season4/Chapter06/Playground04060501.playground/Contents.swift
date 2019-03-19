// 6-5 闭包中的强引用循环
// https://www.imooc.com/video/12663

import UIKit

class Country {
    let name: String
    var capital: City! // 隐式可选性
    
    init(countryName: String, capitalName: String) {
        self.name = countryName
        // 非空属性都已经设置
        // 先初始化，再使用self（两段式构造）
        self.capital = City(cityName: countryName, country: self)
        print("Country", name, "is initialized")
    }
    
    deinit {
        print("Country", name, "is being deinitialized")
    }
    
    
}

class City {
    let name: String
    unowned let country: Country
    
    init(cityName: String, country: Country) {
        self.name = cityName
        self.country = country
        print("City", name, "is initialized")
    }
    
    deinit {
        print("City", name, "is being deinitialized")
    }
}

var china: Country? = Country(countryName: "China", capitalName: "Beijing")
china = nil
// Console output:
//City China is initialized
//Country China is initialized
//Country China is being deinitialized
//City China is being deinitialized
