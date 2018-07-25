//
//  LoginViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 tripim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var UIButton: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    
    let accept = "abcdeABCDE"
    let cs = NSCharacterSet(charactersIn: accept).inverted
    
    let filtered = string.components(separatedBy: cs).joined(separator:  "")
    
    if(string != filtered){
        return false
    }
    
    
    var maxLength : Int=0
    if textField.tag==1{
          maxLength=4
    }
    
    
    
    if textField.tag==2{
         maxLength=5
    }
    
    let currentString : NSString = textField.text!  as NSString
    
    let newSting : NSString=currentString.replacingCharacters(in: range, with: string) as NSString
    return newSting.length <= maxLength
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag==1{
            textField.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        }
        if textField.tag==2{
            textField.resignFirstResponder()
        }
        return true
    }
    

   
}
