## Swift基础语法(24-方法,self关键字,mutating方法,类方法) ##

[参考网页](https://www.cnblogs.com/jordanYang/p/5378464.html)

### 方法 ###
```swift
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
```

### self关键字 ###
```swift
import Cocoa

//self关键字
//Swift中的self和OC中的self基本一样. self指当前对象
//如果self在对象方法中代表当前对象. 但是在类方法中没有self
class Person {
    var name:String = "qbs";
    var age:Int = 30;
    //当参数名称和属性名称一模一样时,
    //无法区分哪个是参数哪个是属性
    //这个时候可以通过self明确的来区分参数和属性
    func setName(name:String, age:Int)  {
        //默认情况下, _name和_age前面有一个默认的self关键字,
        //因为所有变量都需要先定义再使用
        //而setName方法中并没有定义过_name和_age,
        //而是在属性中定义的, 所以setName中访问的其实是属性,
        //编译器默认帮我们在前面加了一个self.
        // _name = name;
        // _age = age;
        self.name = name;
        self.age = age;
    }
    func show()  {
        print("name = \(name) age = \(age)")
    }
}
var p = Person();
p.setName(name: "xy", age: 20);
p.show();
//输出结果: name = xy age = 20
```

### mutating方法 ###
```swift
import Cocoa

// mutating方法
// 值类型(结构体和枚举)默认方法是不可以修改属性的
// 如果需要修改属性
// 需要在方法前加上mutating关键字, 让该方法变为一个改变方法
struct Person {
    var name:String = "qbs";
    var age:Int = 30;
    // 值类型(结构体和枚举)默认方法是不可以修改属性的
    // 如果需要修改属性
    // 需要在方法前加上mutating关键字, 让该方法变为一个改变方法
    // 注意: 类不需要, 因为类的实例方法默认就可以修改
    mutating func setName(name:String, age:Int) {
        self.name = name;
        self.age = age;
    }
    func show() {
        print("name = \(name) age = \(age)");
    }
}
var p = Person();
p.setName(name: "zs", age: 99);
p.show();
//输出结果: name = zs age = 99
enum LightSwitch{
    case OFF, ON;
    mutating func next()  {
        switch self{
        case OFF:
            self = ON;
        case ON:
            self = OFF;
        }
    }
}
var ls:LightSwitch = LightSwitch.OFF
if ls == LightSwitch.OFF {
    print("off")
}
ls.next()
if ls == LightSwitch.ON {
    print("on")
}
//输出结果:
//off
//on
```

### 类方法 ###
```swift
import Cocoa

// 类方法:
// 和类属性一样通过类名来调用
// 类方法通过static关键字(结构体/枚举), class(类)
// 类方法中不存在self
struct Person {
    var name:String = "qbs";
    static var card: String = "123456";
    func show() {
        print("name = \(self.name) card = \(Person.card)");
    }
    static func staticShow() {
        // 类方法中没有self [Instance member 'name' cannot be used on type 'Person']
        //print("name = \(self.name) card = \(Person.card)");
        // 静态方法对应OC中的+号方法, 和OC一样在类方法中不能访问非静态属性
        print("card = \(Person.card)");
    }
}
var p = Person();
p.show();
Person.staticShow();
//输出结果:
//name = qbs card = 123456
//card = 123456
```
