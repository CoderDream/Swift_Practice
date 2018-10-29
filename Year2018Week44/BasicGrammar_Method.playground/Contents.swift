import Cocoa

//swift基础语法(24-方法,self关键字,mutating方法,类方法)
//方法
//隶属于每一个类或结构体的函数称之为方法:
//方法分为类方法和实例方法, 对应OC中的+ - 方法
//实例方法:实例方法一定是通过对象来调用的, 实例方法隶属于某一个类
class Person {
    var _name:String = "qbs";
    var _age:Int = 30;
    //实例方法一定是通过对象来调用的, 实例方法隶属于某一个类
    // func setName(name:String, age:Int)
    //如果不希望某个参数作为外部参数, 可以在参数前面加上_, 忽略外部参数
    func setName(name:String, _ age:Int)  {
        _name = name
        _age = age
    }
    func show() {
        print("name = \(_name) age = \(_age)")
    }
}
var p = Person();
// 由于第一个参数可以通过方法名称指定, 所以默认第一个参数不作为外部参数
// p.setName(name: "zs", age: 88);

//可以在参数前面加上_, 忽略外部参数
p.setName(name: "zs", 88);
p.show();
//输出结果: name = zs age = 88
