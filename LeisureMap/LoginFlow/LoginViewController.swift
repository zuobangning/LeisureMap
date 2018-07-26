//
//  LoginViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 tripim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITextFieldDelegate, AsyncReponseDelegate{
    func receiveResponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        <#code#>
    }
    
//    func receiveResponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
//
//    }
    
   
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var UIButton: UIButton!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtAccount: UITextField!
    
    var requestWorker : AsyncRequestWorker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func btnLoginClicked(_ sender: Any){
        _ = txtAccount.text!
        _ = txtPassword.text!
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("wiewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            print("viewDidAppear")
        }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
       print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidDisappear")
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
    
    func receviedReponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int){
        print(responseString)
        // let default : UserDefaults=UserDefaults.standard
        
        
        //defaults.set(responseString, forKey: "serviceVersion")
        //defaults.synchronize()
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveTologinViewSegue", sender: self)
        }
    }
   
}
