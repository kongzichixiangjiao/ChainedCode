//
//  ViewController.swift
//  链式编程
//
//  Created by houjianan on 16/7/22.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chained = Chained()
        
        chained.show { (message) in
            print(message)
        }.add {
            message in
            print(message)
        }.hide {
            message in
            print(message)
        }.remove(false) {
            [weak self] message in
            if let weakSelf = self {
                weakSelf.action(message)
            }
        }
    }
    
    func action(message: String) {
        print(message)
    }
    
}

//
//  Chained.swift
//  链式编程
//
//  Created by houjianan on 16/7/22.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import Foundation

class Chained: NSObject {
    
    typealias Handler = (message: String) -> ()
    
    func add(handler: Handler) -> Chained {
        handler(message: "添加成功")
        return self
    }
    
    func show(handler: Handler) -> Chained {
        handler(message: "显示成功")
        return self
    }
    
    func hide(handler: Handler) -> Chained {
        handler(message: "隐藏成功")
        return self
    }
    
    func remove(isRemove: Bool, handler: Handler) -> Chained {
        handler(message: "删除成功")
        return self
    }
    
}
