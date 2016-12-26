//
//  ViewController.swift
//  DemoChat
//
//  Created by Rajeev Kumar on 12/20/16.
//  Copyright © 2016 Rajeev. All rights reserved.
//

import UIKit
import SocketIO

class LoginVC: ParentVC, UITextFieldDelegate {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var btnBeginChat: UIButton!
    var textFieldGlobal:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.delegate = self
        textFieldGlobal = txtUsername
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LoginVC.dismissKeyoard))
        self.view.addGestureRecognizer(tapGesture)
        

    
    }
    override func viewWillAppear(_ animated: Bool) {
                constant.sh.socket.connect()
                constant.sh.socket.on("connect") {data, ack in
                    print("socket connected")
        
                }
                constant.sh.socket.on("logged in") { (data, ack) in
                    constant.sh.socket.off("logged in")
                    constant.sh.allUsers = (data[0] as! [String]).filter{$0 != self.txtUsername.text}
                    print(constant.sh.allUsers)
                    self.performSegue(withIdentifier: "login_segue", sender: self)
                }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        textFieldGlobal.resignFirstResponder()
    
    }
   
    func dismissKeyoard(){
        textFieldGlobal.resignFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination
        vc.navigationItem.title = txtUsername.text?.trimmingCharacters(in: CharacterSet.whitespaces)
        vc.navigationController?.navigationItem.backBarButtonItem?.title = ""
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }

    @IBAction func btnBeginChatClicked(_ sender: Any) {
        if (txtUsername.text!.isEmpty == true) {
            print("dddd")
            Utility.sharedInstance.showAlert(title: "Login",msg: "Please enter User Name", viewCtrl: self)
        }else{
        constant.sh.socket.emit("login", ["name" : self.txtUsername.text])
        }
        
    }
    
    // Mark: textfield delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        btnBeginChat.sendActions(for: .touchUpInside)
        textField.resignFirstResponder()

        return false
    }
}

