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
    case OFF
    case ON
    mutating func next()  {
        switch self{
        case .OFF:
            self = .ON;
        case .ON:
            self = .OFF;
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
