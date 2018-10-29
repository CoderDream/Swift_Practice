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
