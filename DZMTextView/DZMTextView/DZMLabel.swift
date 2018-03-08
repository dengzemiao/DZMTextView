//
//  DZMLabel.swift
//  DZMTextView
//
//  Created by 邓泽淼 on 2018/3/7.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

enum DZMTextAlignmentVertical {
    case top
    case center
    case bottom
}

import UIKit

class DZMLabel: UILabel {

    /// [textAlignment : Horizontal]
    /// [textAlignmentVertical : Vertical]
    var textAlignmentVertical:DZMTextAlignmentVertical = .center {
        
        didSet{ setNeedsDisplay() }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        
        var textRect:CGRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        
        if textAlignmentVertical == .top {
            
            textRect.origin.y = 0
            
        }else if textAlignmentVertical == .center {
            
            textRect.origin.y = (bounds.origin.y + bounds.height - textRect.height) / 2
            
        }else if textAlignmentVertical == .bottom {
            
            textRect.origin.y = bounds.origin.y + bounds.height - textRect.height
            
        }else{ }
        
        return textRect
    }

    override func drawText(in rect: CGRect) {
        
        super.drawText(in: textRect(forBounds: rect, limitedToNumberOfLines: numberOfLines))
    }
}
