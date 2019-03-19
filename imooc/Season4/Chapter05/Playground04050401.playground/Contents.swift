// 5-4 defer
// https://www.imooc.com/video/12077
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
        // 推迟到当前作用域结束后执行
        // fp = open(filename) 打开文件
        defer {
            // close(fp)  关闭文件
            print("Have a nice day.")
        }
        
        guard let item = items[itemName] else {
            throw VendingMachine.MyError.NoSuchItem
        }
        
        guard money >= item.price else {
            throw MyError.NotEnoughMoney(item.price)
        }
        
        guard item.count > 0 else {
            throw MyError.OutOfStock
        }
        
        // 多个defer，倒序执行
        defer {
            print("Thank you.")
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

var pocketMoney = 4
// 4
do {
    pocketMoney = try machine.vend(itemName: "Coca Cola", money: pocketMoney)
    print(pocketMoney, " Yuan left")
}
catch let error as VendingMachine.MyError {
    print(error)
}
catch {
    print("Error occured during vending.")
}
print("############")
pocketMoney = 2
// 4
do {
    pocketMoney = try machine.vend(itemName: "Coca Cola", money: pocketMoney)
    print(pocketMoney, " Yuan left")
}
catch let error as VendingMachine.MyError {
    print(error)
}
catch {
    print("Error occured during vending.")
}

//Want something to drink?
//    * Orange Juice
//        * Mineral Water
//            * Coca Cola
//                =========================
//Enjoy your Coca Cola
//Thank you.
//Have a nice day.
//1  Yuan left
//############
//Have a nice day.
//Not Enought Money. 3 Yuan needed.
