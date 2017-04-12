//
//  DZMInputView.swift
//  自动增高TextView简单使用
//
//  Created by haspay on 16/3/17.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit

class DZMInputView: UIView {

    var edgeInsets: UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)      // 输入框的周边间距
    var changeH:CGFloat = 0                                     // 高度变动之后的间距差
    var AnimationDuration:Double = 0.25                         // 动画时间
    var textView:UITextView!                                    // textView
    
    fileprivate var OriginH:CGFloat = 0                             // 原来的高度
    fileprivate var IsInit:Bool = true                              // 是否是初始化第一次
    fileprivate var TextViewSpace:CGFloat = 5                       // textView默认四周的间距 勿动
    var TempDuration:Double = 0                                     // 用来临时记录的动画时间 方便继承后可以使用
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
     获取当前view的高度 没有字的时候获取默认高度
     */
    func height() ->CGFloat {
        
        // 计算text  假如有需要输入的是attributedText 计算attributedText则把这里的text 换成 attributedText
        var textStr:String = textView.text
        
        if textView.text.isEmpty {
            
            textStr = "1"
        }
        
        let maxW = textView.frame.width - textView.textContainerInset.left - textView.textContainerInset.right - 2*TextViewSpace
        
        let textViewSize = (textStr as NSString).boundingRect(with: CGSize(width: maxW, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:textView.font!], context: nil)
        
        let h = ceil(textViewSize.height + textView.textContainerInset.top + textView.textContainerInset.bottom + edgeInsets.top + edgeInsets.bottom)
    
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
