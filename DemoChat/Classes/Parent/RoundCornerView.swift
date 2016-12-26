//
//  RoundCornerView.swift
//  MyCoTra
//
//  Created by Rajeev Sen on 10/30/16.
//  Copyright © 2016 mycotra. All rights reserved.
//

import UIKit
@IBDesignable
class RoundCornerView: UIView {

    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
//    @IBInspectable var borderColor: UIColor? {
//        didSet {
//            layer.borderColor = borderColor?.cgColor
//        }
//    }
    
    @IBInspectable var borderColor : UIColor? {
        get {
            if let cgcolor = layer.borderColor {
                return UIColor(cgColor: cgcolor)
            } else {
                return nil
            }
        }
        set {
            layer.borderColor = newValue?.cgColor
            
            // width must be at least 1.0
            if layer.borderWidth < 1.0 {
                layer.borderWidth = 1.0
            }
        }
    }



}
