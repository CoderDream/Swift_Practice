// 2-4 Swift泛型函数
// https://www.imooc.com/video/12059

import UIKit

func swapTwoInt(_ a:inout Int, _ b:inout Int) {
    (a, b) = (b, a)
}

var a:Int = 0
var b:Int = 6
swapTwoInt(&a, &b)
a
b

func swapTwoDouble(_ a:inout Double, _ b:inout Double) {
    (a, b) = (b, a)
}
var c:Double = 1.1
var d:Double = 6.2
swapTwoDouble(&c, &d)
c
d

func swapTwoThings<T>(_ a:inout T, _ b:inout T) {
    (a, b) = (b, a)
}
var hello = "Hello"
var bye = "Bye"
swapTwoThings(&hello, &bye)
hello
bye

swapTwoThings(&a, &b)
a
b

swapTwoThings(&c, &d)
c
d
// func swap<T>(_ a: inout T, _ b: inout T)
//swap(&<#T##a: T##T#>, &<#T##b: T##T#>)
