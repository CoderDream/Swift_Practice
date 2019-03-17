import UIKit

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

class Rectangle {
    var origin = Point()
    var size = Size()
    
    init(origin:Point, size:Size) {
        self.origin = origin
        self.size = size
    }
}

// 扩展
extension Rectangle {
    
    // 嵌套的枚举类型（顶点）
    enum Vertex:Int {
        case LeftTop
        case RightTop
        case RightBottom
        case LeftBottom
    }
    
    // 返回顶点坐标
    func pointAtVertex(v:Vertex) -> Point {
        switch v {
        case .LeftTop:
            return origin
        case .RightTop:
            return Point(x: origin.x + size.width, y: origin.y)
        case .RightBottom:
            return Point(x: origin.x + size.width, y: origin.y + size.height)
        case .LeftBottom:
            return Point(x: origin.x, y: origin.y + size.height)
        }
    }
    
    // 下标
    subscript(index:Int) -> Point {
        assert(index >= 0 && index < 4, "Index in Rectange Out of Range.")
        return pointAtVertex(v: Vertex(rawValue: index)!)
    }
}

let rect = Rectangle(origin: Point(), size: Size(width: 4, height: 3))
rect.pointAtVertex(v: .RightBottom) // x 4, y 3
rect[2] // x 4, y 3
