import Cocoa

let str = "A"
let str1 = "\u{0041}"

if str == str1 {
    print("相等")
} else {
    print("不相等")
}

let str2 = "ABCD"

if str2.hasPrefix("A") {
    print("有这个前缀A")
}

if str2.hasPrefix("B") {
    print("有这个前缀B")
}

if str2.hasSuffix("C") {
    print("有这个后缀C")
}

if str2.hasSuffix("D") {
    print("有这个后缀D")
}
