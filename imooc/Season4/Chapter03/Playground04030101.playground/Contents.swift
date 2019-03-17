// 3-1 Swift协议基础
// https://www.imooc.com/video/12061

import UIKit

// protocol Pet:class {
protocol Pet {
    var name:String {get set}
    var birthPlace:String {get}
    func playWith()
    func fed(food:String)
    //func fed()
    mutating func changeName(newName:String)
}

// class 不要 mutating

//var pet:Pet = Pet()
struct Dog:Pet {
//    private var myDoggyName:String
//    var name:String {
//        get {
//            return myDoggyName
//        }
//        set {
//            myDoggyName = newValue
//        }
//    }
    var name: String = "Puppy"
    
    var birthPlace: String = "Beijing"
    
    func playWith() {
        print("Wong!")
    }
    
    func fed(food: String = "Bone") {
        if food == "Bone" {
            print("Happy")
        } else {
            print("I want a bone")
        }
    }
    
    mutating func changeName(newName: String) {
        name = newName
    }
    
}

var myDog:Dog = Dog()
myDog.birthPlace = "Shanghai"

var aPet:Pet = myDog
//aPet.birthPlace = "Shanghai" // cannot assign to property: 'birthPlace' is a get-only property


