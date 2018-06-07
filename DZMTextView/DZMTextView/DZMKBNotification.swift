//
//  DZMKBNotification.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/6/7.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

/* info key
 
// 初始Frame
UIKeyboardFrameBeginUserInfoKey
 
// 结束Frame
UIKeyboardFrameEndUserInfoKey
 
// 动画时间
UIKeyboardAnimationDurationUserInfoKey
 
// UIViewAnimationCurve
UIKeyboardAnimationCurveUserInfoKey
 
// 是否是当前App的键盘
UIKeyboardIsLocalUserInfoKey

// 已弃用
UIKeyboardCenterBeginUserInfoKey
UIKeyboardCenterEndUserInfoKey
UIKeyboardBoundsUserInfoKey
*/

@objc protocol DZMKBNotificationProtocol:NSObjectProtocol {
    
    /// 键盘开始显示
    @objc optional func keyboard(willShow notification:NSNotification)
    
    /// 键盘结束显示
    @objc optional func keyboard(didShow notification:NSNotification)
    
    /// 键盘开始隐藏
    @objc optional func keyboard(willHide notification:NSNotification)
    
    /// 键盘结束隐藏
    @objc optional func keyboard(didHide notification:NSNotification)
    
    /// 监听键盘改变frame
    @objc optional func keyboard(willChangeFrame notification:NSNotification)
    
}

class DZMKBNotification: NSObject {
    
    /// 添加键盘监听
    class func add(_ object:DZMKBNotificationProtocol){
        
        let notificationCenter:NotificationCenter = NotificationCenter.default
        
        // 监听键盘开始显示
        if object.responds(to: #selector(object.keyboard(willShow:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.keyboard(willShow:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        }
        
        // 监听键盘结束显示
        if object.responds(to: #selector(object.keyboard(didShow:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.keyboard(didShow:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        }
        
        // 监听键盘开始隐藏
        if object.responds(to: #selector(object.keyboard(willHide:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.keyboard(willHide:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        }
        
        // 监听键盘结束隐藏
        if object.responds(to: #selector(object.keyboard(didHide:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.keyboard(didHide:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        }
        
        // 监听键盘改变frame
        if object.responds(to: #selector(object.keyboard(willChangeFrame:))) {
            
            if NSString(string: UIDevice.current.systemVersion).floatValue >= 5.0 {
                
                notificationCenter.addObserver(object, selector: #selector(object.keyboard(willChangeFrame:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
            }
        }
    }
    
    /// 移除键盘监听
    class func remove(_ object:DZMKBNotificationProtocol) {
        
        let notificationCenter:NotificationCenter = NotificationCenter.default
        
        // 监听键盘开始显示
        if object.responds(to: #selector(object.keyboard(willShow:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        }
        
        // 监听键盘结束显示
        if object.responds(to: #selector(object.keyboard(didShow:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        }
        
        // 监听键盘开始隐藏
        if object.responds(to: #selector(object.keyboard(willHide:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        }
        
        // 监听键盘结束隐藏
        if object.responds(to: #selector(object.keyboard(didHide:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        }
        
        // 监听键盘改变frame
        if object.responds(to: #selector(object.keyboard(willChangeFrame:))) {
            
            if NSString(string: UIDevice.current.systemVersion).floatValue >= 5.0 {
                
                notificationCenter.removeObserver(object, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
            }
        }
    }
}
