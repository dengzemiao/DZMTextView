//
//  ViewController.swift
//  自动增高TextView简单使用
//
//  Created by haspay on 16/3/17.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    var inputview:DZMInputView!
    
    var one:CeShiOne!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 用于继承修改 inset 即可 不继承可以直接使用
        inputview = DZMInputView()
        inputview.textView.tag = 0
        inputview.backgroundColor = UIColor.red
        view.addSubview(inputview)
        inputview.textView.delegate = self
        inputview.frame = CGRect(x: 10, y: 100, width: 100, height: inputview.TextHeight())

        
        one = CeShiOne()
        one.textView.tag = 1
        one.backgroundColor = UIColor.red
        view.addSubview(one)
        one.textView.delegate = self
        one.frame = CGRect(x: 130, y: 100, width: 200, height: one.TextHeight())
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.tag == 0 {
            
            
            UIView.animate(withDuration: inputview.AnimationDuration, animations: { [weak self]() -> Void in
                self!.inputview.frame.size = CGSize(width: self!.inputview.frame.width, height: self!.inputview.TextHeight())
                
                print("输入之后高度变动inputview \(self!.inputview.changeH) 可用于操作依赖输入框view的空间")
            }) 
        }else{
            
            
            UIView.animate(withDuration: one.AnimationDuration, animations: { [weak self]() -> Void in
                self!.one.frame.size = CGSize(width: self!.one.frame.width, height: self!.one.TextHeight())
                
                print("输入之后高度变动One \(self!.one.changeH) 可用于操作依赖输入框view的空间")
            }) 
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

