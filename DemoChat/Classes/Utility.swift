//
//  Utility.swift
//  DemoChat
//
//  Created by Rajeev Sen on 12/26/16.
//  Copyright © 2016 Niraj. All rights reserved.
//

import UIKit

class Utility: NSObject {
    static let sharedInstance = Utility()
    
    func showAlert(title:String, msg:String,viewCtrl:UIViewController)  {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        viewCtrl.present(alert, animated: true , completion: nil)
    }

}
