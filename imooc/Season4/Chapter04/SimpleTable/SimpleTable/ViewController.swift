//  4-6 UIKit中的委托模式
//  https://www.imooc.com/video/12071
//  ViewController.swift
//  SimpleTable
//
//  Created by CoderDream on 2019/3/18.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

// 实现代理
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = UITableView(frame: view.frame)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        // 设置代理
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
}
