//
//  DZMInputView.swift
//  自动增高TextView简单使用
//
//  Created by haspay on 16/3/17.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit

class DZMInputView: UIView {

    var inset: UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)      // 输入框的周边间距
    var changeH:CGFloat = 0                                     // 高度变动之后的间距差
    var AnimationDuration:Double = 0.25                         // 动画时间
    var textView:UITextView!                                    // textView
    
    private var OriginH:CGFloat = 0                             // 原来的高度
    private var IsInit:Bool = true                              // 是否是初始化第一次
    private var TextViewSpace:CGFloat = 5                       // textView默认四周的间距
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
    }
    
    func addSubviews() {
        
        // 输入框
        textView = UITextView()
        textView.backgroundColor = UIColor.greenColor()
        textView.bounces = false
        textView.scrollEnabled = false
        textView.font = UIFont.systemFontOfSize(13)
        textView.textContainerInset = UIEdgeInsetsMake(8, 5, 8, 5)
        addSubview(textView)
        textView.layer.borderColor = UIColor.grayColor().CGColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 3
        textView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 设置动画时间
        var Duration:Double = AnimationDuration
        let w = frame.size.width
        let h = frame.size.height
        let textViewW = w - inset.right - inset.left
        let textViewH = h - inset.top - inset.bottom
        
        if IsInit {
            IsInit = false
            Duration = 0
        }
        
        UIView.animateWithDuration(Duration) { [weak self]() -> Void in
            
            self!.textView.frame = CGRectMake(self!.inset.left, self!.inset.top, textViewW, textViewH)
        }

    }
    
    /**
     获取当前view的高度 没有字的时候获取默认高度
     */
    func height() ->CGFloat {
        
        var textStr = textView.text
        
        if textView.text.isEmpty {
            textStr = "1"
        }
        
        let maxW = textView.frame.width - textView.textContainerInset.left - textView.textContainerInset.right - 2*TextViewSpace
        
        let textViewSize = (textStr as NSString).boundingRectWithSize(CGSizeMake(maxW, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:textView.font!], context: nil)
        
        let h = textViewSize.height + textView.textContainerInset.top + textView.textContainerInset.bottom + inset.top + inset.bottom
    
        if OriginH > 0 {changeH = h - OriginH}
        
        OriginH = h
        
        return h
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
