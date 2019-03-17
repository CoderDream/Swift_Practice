// 2-5 Swift泛型类型
// https://www.imooc.com/video/12060

import UIKit

let arr:Array<Int> = Array<Int>()
let dict = Dictionary<String, Int>()
let set = Set<Float>()

struct Stack<T> {
    var items = [T]()
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
    
    mutating func push(item:T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        guard !self.isEmpty() else {
            return nil
        }
        
        return items.removeLast()
    }
}

extension Stack {
    func top() -> T? {
        return items.last
    }
}

var s = Stack<Int>()
s.push(item: 1)
s.push(item: 2)
s.pop()
// 2

var ss = Stack<String>()
ss.top()
// nil

struct Pair<T1, T2> {
    var a:T1
    var b:T2
}

var pair = Pair<Int, String>(a: 0, b: "Hello")
pair

