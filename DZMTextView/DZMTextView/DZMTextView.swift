//
//  DZMTextView.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/3/7.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

/// 默认Placeholder字体颜色
let DZMPlaceholderColor:UIColor = UIColor.gray.withAlphaComponent(0.7)

class DZMTextView: UITextView {
    
    /// placeholder
    var placeholder: String? {
        
        didSet{ placeholderLabel.text = placeholder }
    }
    
    /// attributedPlaceholder
    var attributedPlaceholder: NSAttributedString? {
        
        didSet{ placeholderLabel.attributedText = attributedPlaceholder }
    }
    
    /// font
    override var font: UIFont? {
        
        didSet{ placeholderLabel.font = font }
    }
    
    /// textContainerInset
    override var textContainerInset: UIEdgeInsets {
        
        didSet{ setNeedsLayout() }
    }
    
    /// text
    override var text: String! {
        
        didSet{
            
            textDidChange()
            delegate?.textViewDidChange?(self)
        }
    }
    
    /// attributedText
    override var attributedText: NSAttributedString! {
        
        didSet{
            
            textDidChange()
            delegate?.textViewDidChange?(self)
        }
    }
    
    private var placeholderLabel:DZMLabel!
    private var placeholderH:[NSLayoutConstraint]!
    private var placeholderV:[NSLayoutConstraint]!

    // MARK: 初始化
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        creatUI()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {

        super.init(frame: frame, textContainer: textContainer)

        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 创建
    private func creatUI() {
        
        placeholderLabel = DZMLabel()
        placeholderLabel.numberOfLines = 0
        placeholderLabel.textAlignment = .left
        placeholderLabel.lineBreakMode = .byTruncatingTail
        placeholderLabel.textAlignmentVertical = .top
        placeholderLabel.isUserInteractionEnabled = false
        placeholderLabel.backgroundColor = UIColor.clear
        placeholderLabel.textColor = DZMPlaceholderColor
        addSubview(placeholderLabel)
        
        register()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        placeholderLabel.frame = placeholderRect()
    }
    
    func placeholderRect() ->CGRect {
        
        let x:CGFloat = textContainerInset.left + DZMTextViewTextContainerInsetLR
        let y:CGFloat = textContainerInset.top
        let w:CGFloat = frame.size.width - x - textContainerInset.right - DZMTextViewTextContainerInsetLR
        let h:CGFloat = frame.size.height - y - textContainerInset.bottom
        
        return CGRect(x: x, y: y, width: w, height: h)
    }
    
    // MARK: 通知
    private func register() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    @objc private func textDidChange() {
        
        print(font,text)
        
        print(font,attributedText)
        
        placeholderLabel.isHidden = (!text.isEmpty || !attributedText.string.isEmpty)
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
}
