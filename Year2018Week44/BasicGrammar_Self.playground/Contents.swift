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
