//
//  CeShiOne.swift
//  自动增高TextView简单使用
//
//  Created by haspay on 16/3/17.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit

class CeShiOne: DZMInputView {

    override init() {
        
        super.init()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        edgeInsets = UIEdgeInsetsMake(0, 100, 0, 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
