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
    var contentInset:UIEdgeInsets = UIEdgeInsets.zero {
        
        didSet{
            
            updateLayoutTextView()
            
            textView.setNeedsLayout()
        }
    }
    
    private(set) var textView:DZMTextView!
    private var textViewH:[NSLayoutConstraint] = []
    private var textViewV:[NSLayoutConstraint] = []

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        creatUI()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        creatUI()
    }
    
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
        
        let textViewLayoutH:String = "H:|-\(contentInset.left)-[textView]-\(contentInset.right)-|"
        let textViewLayoutV:String = "V:|-\(contentInset.top)-[textView]-\(contentInset.bottom)-|"
        
        textViewH = NSLayoutConstraint.constraints(withVisualFormat: textViewLayoutH, options: NSLayoutFormatOptions.directionLeadingToTrailing, metrics: nil, views: ["textView":textView])
        textViewV = NSLayoutConstraint.constraints(withVisualFormat: textViewLayoutV, options: NSLayoutFormatOptions.directionLeadingToTrailing, metrics: nil, views: ["textView":textView])
        
        addConstraints(textViewH)
        addConstraints(textViewV)
    }
    
    /// 获取DZMInputView高度,默认返回一行高度
    func Height() ->CGFloat {
        
        return DZMTextViewHeight(textView) + contentInset.top + contentInset.bottom
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
