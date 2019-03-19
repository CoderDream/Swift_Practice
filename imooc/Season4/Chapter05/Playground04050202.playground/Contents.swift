// 5-2 ErrorType
// https://www.imooc.com/video/12075
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
        let count: Int
    }
    
    // ErroyType 已经废弃了
    enum MyError: Error {
        case NoSuchItem
        case NotEnoughMoney(Int)
        case OutOfStock
    }
    
    private var items = ["Mineral Water": Item(type: .Water, price: 2, count: 10),
                         "Coca Cola": Item(type: .Cola, price: 3, count: 5),
                         "Orange Juice": Item(type: .Juice, price: 5, count: 3)]
    // 函数体throw，函数声明 throws
    func vend(itemName: String, money: Int) throws -> Int {
        guard let item = items[itemName] else {
            throw VendingMachine.MyError.NoSuchItem
            // return money
        }
        
        guard money >= item.price else {
            throw MyError.NotEnoughMoney(item.price)
            //return money
        }
        
        guard item.count > 0 else {
            throw MyError.OutOfStock
            // return money
        }
        
        //
        
        return money - item.price
    }
    
}
