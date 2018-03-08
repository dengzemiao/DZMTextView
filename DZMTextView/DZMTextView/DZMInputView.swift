//
//  DZMInputView.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/3/7.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

class DZMInputView: UIView {

    /// 输入框四周间距
    var edgeInsets:UIEdgeInsets = UIEdgeInsets.zero {
        
        didSet{ updateLayoutTextView() }
    }
    
    private(set) var textView:DZMTextView!
    private var textViewH:[NSLayoutConstraint] = []
    private var textViewV:[NSLayoutConstraint] = []

    // MARK: 初始化
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        creatUI()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 创建
    private func creatUI() {
        
        textView = DZMTextView()
        textView.bounces = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textView)
        
        updateLayoutTextView()
    }
    
    private func updateLayoutTextView() {
        
        if textView == nil { return }
        
        if !textViewH.isEmpty { removeConstraints(textViewH) }
        if !textViewV.isEmpty { removeConstraints(textViewV) }
        
        let textViewLayoutH:String = "H:|-\(edgeInsets.left)-[textView]-\(edgeInsets.right)-|"
        let textViewLayoutV:String = "V:|-\(edgeInsets.top)-[textView]-\(edgeInsets.bottom)-|"
        
        textViewH = NSLayoutConstraint.constraints(withVisualFormat: textViewLayoutH, options: NSLayoutFormatOptions.directionLeadingToTrailing, metrics: nil, views: ["textView":textView])
        textViewV = NSLayoutConstraint.constraints(withVisualFormat: textViewLayoutV, options: NSLayoutFormatOptions.directionLeadingToTrailing, metrics: nil, views: ["textView":textView])
        
        addConstraints(textViewH)
        addConstraints(textViewV)
    }
    
    // MARK: 计算
    
    /// 获取UITextView的高度
    /// 没有内容默认返回一行高度
    ///
    /// - Returns: 高度
    func textHeight(_ maxW:CGFloat? = nil) ->CGFloat {
        
        var textHeight = textView.textHeight(textView.font!, maxW)
        
        textHeight = textHeight + edgeInsets.top + edgeInsets.bottom
        
        return textHeight
    }
}
