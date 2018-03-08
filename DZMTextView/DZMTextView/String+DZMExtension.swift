//
//  String+DZMExtension.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/3/8.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

extension String {
    
    /// 计算Size
    ///
    /// - Parameters:
    ///   - font: 字体大小
    ///   - size: 范围
    /// - Returns: Size
    func size(_ font:UIFont, _ size:CGSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)) ->CGSize {
        
        return (self as NSString).boundingRect(with: size, options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedStringKey.font:font], context: nil).size
    }
}

extension NSAttributedString {
    
    /// 计算Size
    ///
    /// - Parameter size: 范围
    /// - Returns: Size
    func size(_ size:CGSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)) ->CGSize{
        
        return self.boundingRect(with: size, options: [NSStringDrawingOptions.usesLineFragmentOrigin,NSStringDrawingOptions.usesFontLeading], context: nil).size
    }
}
