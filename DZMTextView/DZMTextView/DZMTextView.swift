//
//  DZMTextView.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/3/7.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

/// 临时文字
private let DZMTempString:String = "D"

/// TextView内容左右默认间距
private let DZMTextViewTextContainerInsetLR:CGFloat = 5.0

/// 获取TextView高度
func DZMTextViewHeight(_ textView:UITextView) ->CGFloat {
    
    var h:CGFloat = 0
    
    let attributedText = textView.attributedText!
    
    let font = textView.font ?? UIFont.systemFont(ofSize: 18)
    
    let frame = textView.frame
    
    let textContainerInset = textView.textContainerInset
    
    let string = attributedText.string.isEmpty ? NSAttributedString(string: DZMTempString, attributes: [NSAttributedStringKey.font : font]) : attributedText
    
    let size = CGSize(width: (frame.width - textContainerInset.left - textContainerInset.right - 2*DZMTextViewTextContainerInsetLR), height: CGFloat.greatestFiniteMagnitude)
    
    h = string.size(size).height
    
    h = ceil(h + textContainerInset.top + textContainerInset.bottom)
    
    return h
}

class DZMTextView: UITextView {
    
    /// placeholder
    var placeholder:String? {
        
        didSet{ placeholderLabel?.text = placeholder }
    }
    
    /// placeholderFont
    var placeholderFont:UIFont! {
        
        didSet{ placeholderLabel?.font = placeholderFont }
    }
    
    /// placeholderTextColor
    var placeholderTextColor:UIColor = UIColor.gray.withAlphaComponent(0.7) {
        
        didSet{ placeholderLabel?.textColor = placeholderTextColor }
    }
    
    /// attributedPlaceholder
    var attributedPlaceholder:NSAttributedString? {
        
        didSet{
            
            placeholderLabel?.attributedText = attributedPlaceholder
            
            placeholderLabel.lineBreakMode = .byTruncatingTail
        }
    }
    
    /// font
    override var font:UIFont? {
        
        didSet{ placeholderFont = font }
    }
    
    /// textContainerInset
    override var textContainerInset:UIEdgeInsets {
        
        didSet{ setNeedsLayout() }
    }
    
    /// text
    override var text:String! {
        
        didSet{ textDidChange() }
    }
    
    /// attributedText
    override var attributedText:NSAttributedString! {
        
        didSet{ textDidChange() }
    }
    
    private var placeholderLabel:DZMLabel!

    // MARK: 初始化
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        creatUI()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {

        super.init(frame: frame, textContainer: textContainer)

        creatUI()
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
        placeholderLabel.textColor = placeholderTextColor
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
        
        placeholderLabel.isHidden = (!text.isEmpty || !attributedText.string.isEmpty)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
}
