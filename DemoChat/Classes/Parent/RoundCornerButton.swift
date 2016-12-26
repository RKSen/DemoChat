//
//  RoundCornerButton.swift
//  MyCoTra
//
//  Created by Rajeev Sen on 12/21/16.
//  Copyright © 2016 mycotra. All rights reserved.
//

import UIKit
@IBDesignable
class RoundCornerButton: UIButton {

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
     @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    

}
