import Cocoa

var str: String? = "Hello"
let greeting = "World!"
if let name = str {
    let message = greeting + name
    print(message)
}

/**
 自然语言解释意思：就是如果str有值,解包它,并且将它的值赋值给name, 然后执行下面的条件语句; 如果str为空, 直接跳过条件语句块。
 */
var str1: String? = "Hello"
// let greeting = "World!"
if (str1 != nil) {
    let message = greeting + str1!
    print(message)
}

/**
 上面例子，我们只是自己知道str1肯定有值, 所以才直接硬解包了str1变量。 但是万一有时候我们的感觉是错的, 那程序在运行时可能会出现严重的错误. 所以Swift中是推荐先检查可选类型是否有值, 然后再进行解包的!
 */


// 错误示范：

var str2:String?  // str1值可能是传过来的值或者从服务器获取的值
let msg = "Hi"
// let txt = msg + str2! // runtime error
// file:///Users/coderdream/Documents/Swift_Practice/Year2018Week46/OptionalDemo.playground:
// error: Playground execution aborted: error: Execution was interrupted,
// reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
// The process has been left at the point where it was interrupted,
// use "thread return -x" to return to the state before expression evaluation.

// Fatal error: Unexpectedly found nil while unwrapping an Optional value

/**
 以上代码在编译阶段不会报错.因为使用了硬解包, 编译器认为可选类型是有值的, 所以编译是通过的. 当代码运行起来时, 知名的错误将会出现: `fatal error: Can't unwrap Optional.None`
 */
