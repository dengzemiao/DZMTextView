//
//  CeShiOne.swift
//  自动增高TextView简单使用
//
//  Created by haspay on 16/3/17.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit

class CeShiOne: DZMInputView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        
        inset = UIEdgeInsetsMake(0, 100, 0, 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
