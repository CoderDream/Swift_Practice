//
//  ViewController.swift
//  UITableView01
//
//  Created by CoderDream on 2019/4/28.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: UITableViewDataSource
    // cell的个数 设置某一章节（section）中的单元格数量，必须实现。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // UITableViewCell 初始化和复用指定索引位置的UITableViewCell，必须实现。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            // .default            包含一个左侧的可选图像视图，和一个左对齐的标签对象。
            //cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            // .value1            包含一个左侧的可选视图和一个左对齐的标签对象，在单元格右侧还有一个灰色、右对齐的标签对象。
            // cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
            //.value2            包含一个左侧、右对齐的蓝色文字标签对象和一个右侧的左对齐的标签对象。
            //cell = UITableViewCell(style: .value2, reuseIdentifier: cellId)
            //.subtitle            包含一个左侧的可选图像视图，和一个左对齐的标签对象，在这个标签对象下方，还有一个字体较小的标签对象。
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = "这个是标题~"
        cell?.detailTextLabel?.text = "这里是内容了油~这里是内容了油~这里是内容了油~这里是内容了油~"
        // 文件在 Assets 里面
        cell?.imageView?.image = UIImage(named: "arrow.jpg") //UIImage(contentsOfFile: path!) // UIImage(named: "Expense_success")
        
        // 文件在根目录下
        //let path = Bundle.main.path(forResource: "star", ofType: "png")
        //cell?.imageView?.image = UIImage(contentsOfFile: path!)
        return cell!
    }
    
    //tableView(_ tableView: UITableView, titleForHeaderInSection section: Int):
    //设置指定章节的标题文字，如果不设置或代理返回值为nil，不显示。
    //
    //tableView(_ tableView: UITableView, titleForFooterInSection section: Int):
    //设置章节脚部标题文字，如果不设置或代理返回值为nil，不显示。
    //
    //tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath):
    //设置表格中指定索引位置的cell是否可编辑，可编辑的cell会显示插入和删除的图标。
    //
    //tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath):
    //当完成插入或删除操作时会调用此方法。
    //
    //tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath):
    //设置指定索引位置的cell是否可以通过拖动的方式，改变它的位置。
    //
    //tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath):
    //当cell从一个位置拖动到另一个位置时调用此方法。

    //MARK: UITableViewDelegate
    // 设置cell高度 设置单元格高度，每当表格需要显示时，都会调用此方法。
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    // 选中cell后执行此方法 当用户点击选择指定索引位置的单元格时，调用此方法。
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    //tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)：
    //设置某一索引下的章节头部的高度。
    //
    //tableView(_ tableView: UITableView, heightForFooterInSection section: Int):
    //设置某一索引下的章节尾部的高度。
    //
    //tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath):
    //当指定索引位置上的单元格即将显示时，调用此方法。此方法是委托对象有机会在单元格显示之前重写其状态属性，如背景颜色等。
    //
    //tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath):
    //当用户点击一个已经被选中的单元格时，调用此方法。
}

