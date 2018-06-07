//
//  ViewController.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/3/7.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate,DZMKBNotificationProtocol {
    
    var label:DZMLabel!
    
    var textView:DZMTextView!
    
    var InputView:DZMInputView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setDZMLabel()
        
        setDZMTextView()
        
        setDZMInputView()
        
        setDZMKBNotification()
    }
    
    // DZMLabel 使用
    func setDZMLabel() {
        
        label = DZMLabel()
        label.text = "DZMLabel使用效果"
        label.backgroundColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .right
        label.textAlignmentVertical = .bottom
        view.addSubview(label)
        label.frame = CGRect(x: 10 , y: 50, width: 300, height: 50)
    }
    
    // DZMTextView 使用
    func setDZMTextView() {
        
        // Frame布局 Layout布局都支持
        textView = DZMTextView()
        textView.placeholder = "DZMTextView支持:\n Placeholder \n AttributedPlaceholder"
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.backgroundColor = UIColor.red
        textView.frame = CGRect(x: 10 , y: 150, width: 300, height: 100)
        view.addSubview(textView)
        
//        let attributedPlaceholder = NSAttributedString.init(string: "提示测试", attributes: [NSAttributedStringKey.foregroundColor : UIColor.green, NSAttributedStringKey.kern : 10])
//        textView.attributedPlaceholder = attributedPlaceholder
    }
    
    // DZMInputView 使用
    func setDZMInputView() {
        
        InputView = DZMInputView()
        InputView.backgroundColor = UIColor.red
        InputView.contentInset = UIEdgeInsetsMake(5, 5, 5, 5)
        InputView.textView.backgroundColor = UIColor.green
        InputView.textView.font = UIFont.systemFont(ofSize: 20)
        InputView.textView.placeholder = "DZMInputView自动计算高度"
        InputView.textView.delegate = self
        InputView.frame = CGRect(x: 10 , y: 300, width: 300, height: InputView.Height())
        view.addSubview(InputView)
    }
    
    // DZMKBNotification
    func setDZMKBNotification() {
        
        DZMKBNotification.add(self)
    }
    
    // MARK: UITextViewDelegate
    
    func textViewDidChange(_ textView: UITextView) {
        
        UIView.animate(withDuration: 0.25) { [weak self] () in
            
            self?.InputView.frame = CGRect(x: 10 , y: 300, width: 300, height: self!.InputView.Height())
            
            // 因为内部TextView使用Layout布局
            self?.InputView.layoutIfNeeded()
        }
    }
    
    // MARK: DZMKBNotificationProtocol
    
    func keyboard(willShow notification: NSNotification) {
        
        print(notification)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        
        DZMKBNotification.remove(self)
    }
}

