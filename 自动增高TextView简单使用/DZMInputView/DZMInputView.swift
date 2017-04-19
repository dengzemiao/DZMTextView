//
//  DZMInputView.swift
//  自动增高TextView简单使用
//
//  Created by haspay on 16/3/17.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit

class DZMInputView: UIView {
    
    var edgeInsets: UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5) // 输入框的周边间距
    var changeH:CGFloat = 0                                     // 高度变动之后的间距差
    var AnimationDuration:Double = 0.25                         // 动画时间
    var textView:UITextView!                                    // textView
    var TempDuration:Double = 0                                 // 用来临时记录的动画时间 方便继承后可以使用
    
    private var OriginH:CGFloat = 0                             // 原来的高度
    private var TextViewSpace:CGFloat = 5                       // textView默认四周的间距 勿动
    private var IsInit:Bool = true                              // 是否是初始化第一次
    private let TempString:String = "1"                         // 用于当没有字符串的时候计算使用
    
    // 直接初始化
    init() {
        
        super.init(frame: CGRect.zero)
        
        addSubviews()
    }
    
    func addSubviews() {
        
        // 输入框
        textView = UITextView()
        textView.backgroundColor = UIColor.green
        textView.bounces = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.textContainerInset = UIEdgeInsetsMake(8, 5, 8, 5)
        addSubview(textView)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 3
        textView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 设置动画时间
        TempDuration = AnimationDuration
        
        let w = frame.size.width
        let h = frame.size.height
        let textViewW = w - edgeInsets.right - edgeInsets.left
        let textViewH = h - edgeInsets.top - edgeInsets.bottom
        
        if IsInit {
            
            IsInit = false
            
            TempDuration = 0
        }
        
        UIView.animate(withDuration: TempDuration, animations: { [weak self]() -> Void in
            
            self!.textView.frame = CGRect(x: self!.edgeInsets.left, y: self!.edgeInsets.top, width: textViewW, height: textViewH)
        })
        
    }
    
    /**
     使用 text 可使用该方法获得高度
     */
    func TextHeight() ->CGFloat {
        
        // 计算text
        var textString:String = textView.text
        
        if textView.text.isEmpty {
            
            textString = TempString
        }
        
        let maxW = textView.frame.width - textView.textContainerInset.left - textView.textContainerInset.right - 2*TextViewSpace
        
        let textViewSize = (textString as NSString).boundingRect(with: CGSize(width: floor(maxW), height: CGFloat.greatestFiniteMagnitude), options: [NSStringDrawingOptions.usesLineFragmentOrigin,NSStringDrawingOptions.usesFontLeading], attributes: [NSFontAttributeName:textView.font!], context: nil)
        
        let h = ceil(textViewSize.height + textView.textContainerInset.top + textView.textContainerInset.bottom + edgeInsets.top + edgeInsets.bottom)
        
        return calculationHeight(h: h)
    }
    
    /**
     使用 attributedText 可使用该方法获得高度
     
     attrs: 当 attributedText 没有值 得时候进行使用计算 不设置则使用默认字体 textView.font
     
     */
    func AttributedTextHeight(_ attrs: [String : Any]? = nil) ->CGFloat {
        
        // 计算attributedText
        var textString:NSAttributedString = textView.attributedText
        
        if textString.string.isEmpty {
            
            // 属性是否需要自定义
            var tempAttrs:[String : Any]!
            
            // 有自定义
            if attrs != nil {
                
                tempAttrs = attrs
                
            }else{
                // 无自定义
                
                tempAttrs = [NSFontAttributeName:textView.font!]
            }
            
            textString = NSAttributedString(string: TempString, attributes:tempAttrs)
        }
        
        let maxW = textView.frame.width - textView.textContainerInset.left - textView.textContainerInset.right - 2*TextViewSpace
        
        let textViewSize = textString.boundingRect(with: CGSize(width: maxW, height:CGFloat.greatestFiniteMagnitude), options: [NSStringDrawingOptions.usesLineFragmentOrigin,NSStringDrawingOptions.usesFontLeading], context: nil)
        
        let h = ceil(textViewSize.height + textView.textContainerInset.top + textView.textContainerInset.bottom + edgeInsets.top + edgeInsets.bottom)
        
        return calculationHeight(h: h)
    }
    
    /// 计算
    private func calculationHeight(h:CGFloat) ->CGFloat {
        
        if OriginH > 0 {
            
            changeH = h - OriginH
            
        }else{
            
            changeH = 0
        }
        
        OriginH = h
        
        return h
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
}
