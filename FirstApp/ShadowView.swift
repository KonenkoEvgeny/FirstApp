//
//  ShadowView.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 28.01.2022.
//

import UIKit

@IBDesignable class ShadowView: UIView {

    // Не пойму, вроде и выбираю в сториборде другие значения, но они похоже не меняются, где ошибки?
    
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = 45  }
        get { return layer.cornerRadius }
    }
    
    @IBInspectable var shadowColor: CGColor? {
        // в сториборде не даёт выбрать цвет, как сделать правильно?
        set { layer.shadowColor = UIColor.black.cgColor }
        get { return layer.shadowColor }
    }
    @IBInspectable var shadowOffset: CGSize {
        set { layer.shadowOffset = CGSize (width: 10, height: 10)  }
        get { return layer.shadowOffset }
    }
    @IBInspectable var shadowRadius: CGFloat {
        set { layer.shadowRadius = 20  }
        get { return layer.shadowRadius }
    }
    @IBInspectable var shadowOpacity: CGFloat = 0.7 {
        didSet{
        setNeedsDisplay()
        }
        
        
//        // не получается сделать тут тип CGFloat, в сториборде выбираются только целые числа
//        set { layer.shadowOpacity = 0.7  }
//        get { return layer.shadowOpacity }
   }
    
 
    
//    layer.cornerRadius = 45
//    layer.cornerRadius = 45
//    layer.shadowColor = UIColor.black.cgColor
//    layer.shadowOffset = CGSize (width: 10, height: 10)
//    layer.shadowRadius = 20
//    layer.shadowOpacity = 0.7

}
