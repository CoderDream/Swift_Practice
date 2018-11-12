import Cocoa

// var str = "Hello, playground"

//在Swift中，主要通过is和as两个运算符来检查一个对象是不是属于某个类或者把一个对象转成某种类。
//这里主要针对指针类，对于值类可以通过如下方式进行转换：

let hourlyRate = 19.5
let hoursWorked = 10
let totalCost = hourlyRate * Double(hoursWorked)
// 这里hoursWorked本来编译器会自动推断为Int类型，通过Double()转换之后就变成了Double类型。


//先建一个类体系
//首先建一个叫MediaItem的基类，它有一个name属性：
class MediaItem: NSObject {
    
    var name: String
    init(name: String) {
        self.name = name
    }
}
// 再建两个子类，Movie和Song，分别增加一个director属性和artist属性：
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
// 通过字面量方法创建一个数组，里面有两个Movie和三个Song。
// 因为Swift的类检查器可以推断Movie和Song有一个共同的父类MediaItem，
// 所以它会断定该数组是一个[MediaItem]类型的数组：
let library = [
    Movie(name: "KF_Movie_1", director: "Wudao"),
    Song(name: "KF_Song_1", artist: "Qingge"),
    Movie(name: "KF_Movie_2", director: "Hetu"),
    Song(name: "KF_Song_2", artist: "Shantai"),
    Song(name: "KF_Song_3", artist: "Jianjia"),
]

// 这个library里的元素明显是Movie和Song，
// 但是如果循环浏览，会发现它返回的类型是MediaItem，并不是Movie和Song。
// 为了用到每个元素它实际的类型的属性、方法，这时候我们就需要检查或者转换它了。
//检查类型
//定义两个变量movieCount和songCount，利用is检查元素的类型，是Movie的话，movieCount加1，是Song的话，则songCount加1。
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
//运行结果：
//
//Media library contains 2 movies and 3 songs
//显然通过is可以判断出数组里有2个Movie，三个Song。

//类型转换
//Swift中类型转换有两个类型转换符：as?和as!。as?返回的是一个可选值，可能为nil，as!返回的是一个展开的具体的值。
//简单的说，如果你明确知道要转换类型的那个元素真正类型，确保能转换成功，这时候就用as!，否则，用as?。
//在librar这个例子，我想分别打印出movie和song的相关信息，就得用到类型转换符，
//这里因为元素可能是Movie，也可能是Song，类型不能确定，所以用as?转换符：

for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir.\(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}
//运行结果：
//Movie: KF_Movie_1, dir.Wudao
//Song: KF_Song_1, by Qingge
//Movie: KF_Movie_2, dir.Hetu
//Song: KF_Song_2, by Shantai
//Song: KF_Song_3, by Jianjia
//这个例子牵涉到了可选值(optional)的展开方式，这里不展开细讲，有问题可以给我发邮件或直接在评论区提出。

//Any和AnyObject的类型转换
//Swift中，定义了两个特殊的类名来替代那些没有具体指明类型的类:
//
//AnyObject: 可以代表任何类。
//Any: 可以代表任何类的实例，包括函数。
//在开发中，我们有时候会获得一个[AnyObject]类型的数组，或者一个元素可以为任何类型的数组，但事实上我们很确定这个数组的元素是什么类型，这种情况我们可以用as!把AnyObject转换成更具体的那个类。如下,先定义一个[AnyObject]类型的数组：

let someObjects: [AnyObject] = [
    Movie(name: "KF_Movie_3", director: "Guoshi"),
    Movie(name: "KF_Movie_4", director: "Wushuang"),
    Movie(name: "KF_Movie_5", director: "Fenglei")
]
// 在这里，我们知道数组的元素都是Movie，所以用as!转换：

for object in someObjects {
    let movie = object as! Movie
    print("Movie: \(movie.name), dir. \(movie.director)")
}

// Any转换，先定义一个[Any]类型数组，其实就是包含任何类型元素的数组：

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "KF_Movie_6", director: "kefan"))
things.append({ (name: String) -> String in "Hello, \(name)" })
// 可以通过is和as来判断元素的类型进行操作：

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
   // case let stringConverter as String -> String:
  //      print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
//运行结果：
//
//zero as an Int
//zero as a Double
//an integer value of 42
//a positive double value of 3.14159
//a string value of "hello"
//an (x, y) point at 3.0, 5.0
//a movie called KF_Movie_6, dir. kefan
//Hello, Michael


//Swift类型转换浅析
//作者：KFAaron
//链接：https://www.jianshu.com/p/d78c138dfbca
//來源：简书
//简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
