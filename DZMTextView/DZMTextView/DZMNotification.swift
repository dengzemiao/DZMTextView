//
//  CWApplicationNotification.swift
//  DZMTextView
//
//  Created by dengzemiao on 2018/12/10.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

@objc protocol DZMNotificationProtocol:NSObjectProtocol {
    
    // MARK: 键盘
    
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
    
    
    // MARK: APP
    
    /// APP启动回调
    @objc optional func app(didFinishLaunching notification:NSNotification)
    
    /// APP从后台将要进入前台
    @objc optional func app(willEnterForeground notification:NSNotification)
    
    /// (APP启动 || APP从后台)进入前台完成
    @objc optional func app(didBecomeActive notification:NSNotification)
    
    /// APP将要进入后台
    @objc optional func app(willResignActive notification:NSNotification)
    
    /// APP已经进入后台
    @objc optional func app(didEnterBackground notification:NSNotification)
    
    /// APP将要退出
    @objc optional func app(willTerminate notification:NSNotification)
    
    /// APP内存不够用时,警告回调
    @objc optional func app(didReceiveMemoryWarning notification:NSNotification)
    
    /// APP截屏
    @objc optional func app(userDidTakeScreenshot notification:NSNotification)
    
    
    // MARK: Window
    
    /// UIWindow变为可见
    @objc optional func window(becomeVisible notification:NSNotification)
    
    /// UIWindow变为不可见
    @objc optional func window(becomeHidden notification:NSNotification)
    
    /// UIWindow变为key
    @objc optional func window(becomeKey notification:NSNotification)
    
    /// UIWindow已注销主窗口状态
    @objc optional func window(resignKey notification:NSNotification)
    
}

class DZMNotification: NSObject {
    
    // MARK: 键盘
    
    /// 添加监听
    class func addKB(_ object:DZMNotificationProtocol) {
        
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
    
    /// 移除监听
    class func removeKB(_ object:DZMNotificationProtocol) {
        
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
    
    
    // MARK: APP
    
    /// 添加监听
    class func addAPP(_ object:DZMNotificationProtocol) {
        
        let notificationCenter:NotificationCenter = NotificationCenter.default
        
        // APP启动回调
        if object.responds(to: #selector(object.app(didFinishLaunching:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.app(didFinishLaunching:)), name: NSNotification.Name.UIApplicationDidFinishLaunching, object: nil)
        }
        
        // APP从后台将要进入前台
        if object.responds(to: #selector(object.app(willEnterForeground:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.app(willEnterForeground:)), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        }
        
        // (APP启动 || APP从后台)进入前台完成
        if object.responds(to: #selector(object.app(didBecomeActive:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.app(didBecomeActive:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        }
        
        // APP将要进入后台
        if object.responds(to: #selector(object.app(willResignActive:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.app(willResignActive:)), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        }
        
        // APP已经进入后台
        if object.responds(to: #selector(object.app(didEnterBackground:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.app(didEnterBackground:)), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        }
        
        // APP将要退出
        if object.responds(to: #selector(object.app(willTerminate:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.app(willTerminate:)), name: NSNotification.Name.UIApplicationWillTerminate, object: nil)
        }
        
        // APP内存不够用时,警告回调
        if object.responds(to: #selector(object.app(didReceiveMemoryWarning:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.app(didReceiveMemoryWarning:)), name: NSNotification.Name.UIApplicationDidReceiveMemoryWarning, object: nil)
        }
        
        // APP截屏
        if object.responds(to: #selector(object.app(userDidTakeScreenshot:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.app(userDidTakeScreenshot:)), name: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
        }
    }
    
    /// 移除监听
    class func removeAPP(_ object:DZMNotificationProtocol) {
        
        let notificationCenter:NotificationCenter = NotificationCenter.default
        
        // APP启动回调
        if object.responds(to: #selector(object.app(didFinishLaunching:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIApplicationDidFinishLaunching, object: nil)
        }
        
        // APP将要进入后台
        if object.responds(to: #selector(object.app(willResignActive:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        }
        
        // (APP启动 || APP从后台)进入前台完成
        if object.responds(to: #selector(object.app(didBecomeActive:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        }
        
        // APP已经进入后台
        if object.responds(to: #selector(object.app(didEnterBackground:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        }
        
        // APP从后台将要进入前台
        if object.responds(to: #selector(object.app(willEnterForeground:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        }
        
        // APP将要退出
        if object.responds(to: #selector(object.app(willTerminate:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIApplicationWillTerminate, object: nil)
        }
        
        // APP内存不够用时,警告回调
        if object.responds(to: #selector(object.app(didReceiveMemoryWarning:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIApplicationDidReceiveMemoryWarning, object: nil)
        }
        
        // APP截屏
        if object.responds(to: #selector(object.app(userDidTakeScreenshot:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
        }
    }
    
    
    // MARK: Window
    
    /// 添加监听
    class func addWindow(_ object:DZMNotificationProtocol) {
        
        let notificationCenter:NotificationCenter = NotificationCenter.default
        
        // UIWindow变为可见
        if object.responds(to: #selector(object.window(becomeVisible:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.window(becomeVisible:)), name: NSNotification.Name.UIWindowDidBecomeVisible, object: nil)
        }
        
        // UIWindow变为不可见
        if object.responds(to: #selector(object.window(becomeHidden:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.window(becomeHidden:)), name: NSNotification.Name.UIWindowDidBecomeHidden, object: nil)
        }
        
        // UIWindow变为key
        if object.responds(to: #selector(object.window(becomeKey:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.window(becomeKey:)), name: NSNotification.Name.UIWindowDidBecomeKey, object: nil)
        }
        
        // UIWindow已注销主窗口状态
        if object.responds(to: #selector(object.window(resignKey:))) {
            
            notificationCenter.addObserver(object, selector: #selector(object.window(resignKey:)), name: NSNotification.Name.UIWindowDidResignKey, object: nil)
        }
    }
    
    /// 移除监听
    class func removeWindow(_ object:DZMNotificationProtocol) {
        
        let notificationCenter:NotificationCenter = NotificationCenter.default
        
        // UIWindow变为可见
        if object.responds(to: #selector(object.window(becomeVisible:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIWindowDidBecomeVisible, object: nil)
        }
        
        // UIWindow变为不可见
        if object.responds(to: #selector(object.window(becomeHidden:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIWindowDidBecomeHidden, object: nil)
        }
        
        // UIWindow变为key
        if object.responds(to: #selector(object.window(becomeKey:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIWindowDidBecomeKey, object: nil)
        }
        
        // UIWindow已注销主窗口状态
        if object.responds(to: #selector(object.window(resignKey:))) {
            
            notificationCenter.removeObserver(object, name: NSNotification.Name.UIWindowDidResignKey, object: nil)
        }
    }
}
