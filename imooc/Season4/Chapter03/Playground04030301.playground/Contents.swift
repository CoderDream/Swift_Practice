// 3-3 为什么使用协议？
// https://www.imooc.com/video/12063

import UIKit

protocol Pet {
    var name:String {get set}
}

protocol Flyable {
    var flySpeed:Double {get}
    var flyHeight:Double {get}
}

class Animal {
}

class Dog:Animal, Pet {
    var name: String = "Puppy"
}

class Cat:Animal, Pet {
    var name: String = "Kitten"
}

class Bird:Animal, Flyable {
    var flySpeed: Double
    var flyHeight: Double
    
    init(flySpeed:Double, flyHeight:Double) {
        self.flySpeed = flySpeed
        self.flyHeight = flyHeight
    }
}

class Parrot:Bird, Pet {
    var name: String
    
    init(name:String, flySpeed:Double, flyHeight:Double) {
        self.name = name + "  " + name
        super.init(flySpeed:flySpeed, flyHeight: flyHeight)
    }
}

class Sparrow:Bird {
    var color = UIColor.gray
}

class Vehicle {
    
}

class Plane:Vehicle, Flyable {
    var model: String
    var flySpeed: Double
    var flyHeight: Double
    
    init(model:String, flySpeed:Double, flyHeight:Double) {
        self.model = model
        self.flySpeed = flySpeed
        self.flyHeight = flyHeight
    }
}

var dog = Dog()
var cat = Cat()
var parrot = Parrot(name: "hi", flySpeed: 10.0, flyHeight: 100.0)

let pets: [Pet] = [dog, cat, parrot]
for pet in pets {
    print(pet.name)
}

var sparrow = Sparrow(flySpeed: 15.0, flyHeight: 80.0)
var plane = Plane(model: "Boeing 747", flySpeed: 200.0, flyHeight: 10_000.0)

let flyers: [Flyable] = [parrot, sparrow, plane]
for flyer in flyers {
    print("Fly speed: ", flyer.flySpeed, "Fly height: ", flyer.flyHeight)
}

//Puppy
//Kitten
//hi  hi
//Fly speed:  10.0 Fly height:  100.0
//Fly speed:  15.0 Fly height:  80.0
//Fly speed:  200.0 Fly height:  10000.0


