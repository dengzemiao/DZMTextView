//
//  DZMTextField.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/10/23.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

@objc protocol DZMTextFieldDelegate:UITextFieldDelegate {
    
    @objc optional func textFieldDidChange(_ textField: UITextField)
}

class DZMTextField: UITextField, UITextFieldDelegate {
    
    weak var aDelegate: DZMTextFieldDelegate? {
        
        didSet{ delegate = self }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        Init()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        Init()
    }
    
    private func Init() {
        
        addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        
        aDelegate?.textFieldDidChange?(textField)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return aDelegate?.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        aDelegate?.textFieldDidBeginEditing?(textField)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return aDelegate?.textFieldShouldEndEditing?(textField) ?? true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        aDelegate?.textFieldDidEndEditing?(textField)
    }
    
    @available(iOS 10.0, *)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        aDelegate?.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
         return aDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        return aDelegate?.textFieldShouldClear?(textField) ?? false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return aDelegate?.textFieldShouldReturn?(textField) ?? false
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
