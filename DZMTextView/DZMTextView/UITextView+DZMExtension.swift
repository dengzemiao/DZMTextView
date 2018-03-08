//
//  UITextView+DZMExtension.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/3/7.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

/// 临时文字
private let DZMTempString:String = "D"

/// TextView内容左右默认间距
let DZMTextViewTextContainerInsetLR:CGFloat = 5.0

extension UITextView {
    
    /// 获取UITextView的高度
    /// 没有内容默认返回一行高度
    ///
    /// - Parameters:
    ///   - font: 字体大小用于无内容进行计算
    ///   - maxW: 文字计算范围宽度 默认使用(控件宽度,如果没有控件宽度则使用CGFloat的最大值)
    /// - Returns: 高度
    func textHeight(_ font:UIFont, _ maxW:CGFloat? = nil) ->CGFloat {

        var textHeight:CGFloat = 0

        let tempText:NSAttributedString = attributedText.string.isEmpty ? NSAttributedString(string: DZMTempString, attributes: [NSAttributedStringKey.font : font]) : attributedText

        var maxW:CGFloat = maxW ?? (frame.width - textContainerInset.left - textContainerInset.right - 2*DZMTextViewTextContainerInsetLR)

        if maxW < 0 { maxW = CGFloat.greatestFiniteMagnitude }

        textHeight = tempText.size(CGSize(width: maxW, height: CGFloat.greatestFiniteMagnitude)).height

        textHeight = ceil(textHeight + textContainerInset.top + textContainerInset.bottom)

        return textHeight
    }
}
