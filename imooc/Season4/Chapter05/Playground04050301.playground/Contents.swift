// 5-3 错误处理
// https://www.imooc.com/video/12076
import UIKit

class VendingMachine {
    struct Item {
        enum `Type`: String {
            case Water
            case Cola
            case Juice
        }
        
        let type: Type
        let price: Int
        var count: Int
    }
    
    // ErroyType 已经废弃了
    enum MyError: Error, CustomStringConvertible {
        case NoSuchItem
        case NotEnoughMoney(Int)
        case OutOfStock
        
        var description: String {
            switch self {
            case .NoSuchItem:
                return "No Such Item"
            case .NotEnoughMoney(let price):
                return "Not Enought Money. " + String(price) + " Yuan needed."
            case .OutOfStock:
                return "Out of Stock"
            }
        }
    }
    
    private var items = ["Mineral Water": Item(type: .Water, price: 2, count: 10),
                         "Coca Cola": Item(type: .Cola, price: 3, count: 5),
                         "Orange Juice": Item(type: .Juice, price: 5, count: 3)]
    // 函数体throw，函数声明 throws
    func vend(itemName: String, money: Int) throws -> Int {
        guard let item = items[itemName] else {
            throw VendingMachine.MyError.NoSuchItem
        }
        
        guard money >= item.price else {
            throw MyError.NotEnoughMoney(item.price)
        }
        
        guard item.count > 0 else {
            throw MyError.OutOfStock
        }
        
        dispenseItem(itemName: itemName)
        
        return money - item.price
    }
    
    private func dispenseItem(itemName: String) {
        items[itemName]!.count -= 1
        print("Enjoy your", itemName)
    }
    
    func display() {
        print("Want something to drink?")
        for itemName in items.keys {
            print("*", itemName)
        }
        print("=========================")
    }
}

let machine = VendingMachine()
machine.display()

var pocketMoney = 3
// 处理异常：
// 1. 忽略
try! machine.vend(itemName: "Coca Cola", money: pocketMoney) // 0
// 2.
try? machine.vend(itemName: "Coca Cola", money: pocketMoney) // 0
pocketMoney = 2
try? machine.vend(itemName: "Coca Cola", money: pocketMoney) // nil
// 2.1
if let leftMoney = try? machine.vend(itemName: "Coca Cola", money: pocketMoney) {
    // do something
    print(leftMoney)
}
else {
    // Error Handing
}
// 3 do catch
do {
    pocketMoney = try machine.vend(itemName: "Coca Cola", money: pocketMoney)
    print(pocketMoney, " Yuan left")
}
catch {
    print("Error occured during vending.")
}
// 3.1
do {
    pocketMoney = try machine.vend(itemName: "Coca Cola", money: pocketMoney)
    print(pocketMoney, " Yuan left")
}
catch VendingMachine.MyError.NoSuchItem {
    print("No Such Item.")
}
catch VendingMachine.MyError.NotEnoughMoney(let price) {
    print("Not Enough Money ", price, " Yuan needed.")
}
catch VendingMachine.MyError.OutOfStock {
    print("Out Of Stock.")
}
// 未知异常
catch {
    print("Error occured during vending.")
}
// 4
do {
    pocketMoney = try machine.vend(itemName: "Coca Cola", money: pocketMoney)
    print(pocketMoney, " Yuan left")
}
catch let error as VendingMachine.MyError {
    print("Error occured during vending.", error)
    print(error)
}
catch {
    print("Error occured during vending.")
}
