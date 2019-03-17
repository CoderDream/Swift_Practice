// 2-2 Swift嵌套类型
// https://www.imooc.com/video/12057

import UIKit

//enum Theme {
//    case DayMode
//    case NightMode
//}

class UI {
    // 嵌套类型
    enum Theme {
        case DayMode
        case NightMode
    }
    
    var fontColor:UIColor!
    var backgroundColor:UIColor!
    var themeMode:Theme = .DayMode {
        didSet {
            self.changeTheme(themeMode: self.themeMode)
        }
    }
    
    init() {
        self.themeMode = .DayMode
        self.changeTheme(themeMode: self.themeMode)
    }
    
    init(themeMode:Theme) {
        self.themeMode = themeMode
        self.changeTheme(themeMode: themeMode)
    }
    
    func changeTheme(themeMode:Theme) {
        switch themeMode {
        case .DayMode:
            fontColor = UIColor.black
            backgroundColor = UIColor.black
        case .NightMode:
            fontColor = UIColor.white
            backgroundColor = UIColor.white
        }
    }
}

let ui = UI()
ui.themeMode
ui.fontColor
ui.backgroundColor

ui.themeMode = UI.Theme.NightMode
//ui.themeMode = .NightMode
ui.themeMode
ui.fontColor
ui.backgroundColor

// String.Index
let str = "Hello World"
str.startIndex

let index:String.Index = str.startIndex
