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
        inputview.backgroundColor = UIColor.redColor()
        view.addSubview(inputview)
        inputview.textView.delegate = self
        inputview.frame = CGRectMake(10, 100, 100, inputview.height())

        
        one = CeShiOne()
        one.textView.tag = 1
        one.backgroundColor = UIColor.redColor()
        view.addSubview(one)
        one.textView.delegate = self
        one.frame = CGRectMake(130, 100, 200, one.height())
    }
    
    func textViewDidChange(textView: UITextView) {
        
        if textView.tag == 0 {
            
            
            UIView.animateWithDuration(inputview.AnimationDuration) { [weak self]() -> Void in
                self!.inputview.frame.size = CGSizeMake(self!.inputview.frame.width, self!.inputview.height())
                
                print("输入之后高度变动inputview \(self!.inputview.changeH) 可用于操作依赖输入框view的空间")
            }
        }else{
            
            
            UIView.animateWithDuration(one.AnimationDuration) { [weak self]() -> Void in
                self!.one.frame.size = CGSizeMake(self!.one.frame.width, self!.one.height())
                
                print("输入之后高度变动One \(self!.one.changeH) 可用于操作依赖输入框view的空间")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

