//
//  ViewController.swift
//  UITableView02
//
//  Created by CoderDream on 2019/4/29.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource = [[String:String]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        dataSource = [
            ["name":"王小明", "sex":"男","icon":"my_def_photo","birthday":"2017-10-11"],
            ["name":"李磊","sex":"男","icon":"my_def_photo","birthday":"2011-12-30"],
            ["name":"韩梅","sex":"女","icon":"my_def_photo","birthday":"2014-9-10"],
            ["name":"JIM","sex":"男","icon":"my_def_photo","birthday":"2008-10-1"]]
        tableView.reloadData()
    }
    
    //MARK: UITableViewDataSource
    // cell的个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell:NewTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? NewTableViewCell
        if cell == nil {
            cell = NewTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        let dict:Dictionary = dataSource[indexPath.row]
        // 图片放到 Assets 里面，名称为：my_def_photo
        cell?.iconImv.image = UIImage(named: dict["icon"]!)
        cell?.userLabel.text = dict["name"]
        cell?.sexLabel.text = dict["sex"]
        cell?.birthdayLabel.text = dict["birthday"]
        return cell!
    }
    
    //MARK: UITableViewDelegate
    // 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
