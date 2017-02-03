//
//  ViewController.swift
//  SampleNeuraSDKApp
//
//  Created by jyothireddy on 01/02/17.
//  Copyright © 2017 JyothiReddy. All rights reserved.
//

import UIKit
import NeuraSDK

class ViewController: UIViewController
{
    var signpBtn = UIButton(type:.custom)
    var permissionsBtn = UIButton(type:.custom)

    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
        
        signpBtn =  UIButton(frame:CGRect(x: 30,y: 100,width:120,height:30))
        signpBtn.setTitle("SignUP", for: .normal)
        signpBtn.setTitleColor(UIColor.white, for: .normal)
        signpBtn.backgroundColor = UIColor.purple
        self.view.addSubview(signpBtn)
        signpBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        signpBtn.addTarget(self, action: #selector(ViewController.signupBtnClicked), for: .touchUpInside)
        
        
        
        permissionsBtn =  UIButton(frame:CGRect(x: signpBtn.frame.maxX + 30,y: 100,width:120,height:30))
        permissionsBtn.setTitle("ViewPermissions", for: .normal)
        permissionsBtn.setTitleColor(UIColor.white, for: .normal)
        permissionsBtn.backgroundColor = UIColor.purple
        self.view.addSubview(permissionsBtn)
        permissionsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        permissionsBtn.titleLabel?.adjustsFontSizeToFitWidth = true
         permissionsBtn.addTarget(self, action: #selector(ViewController.permissionsBtnClicked), for: .touchUpInside)
        
    }
    
    func signupBtnClicked()
    {
        print("sign up btn clicked")
        
        let permissions: Array = ["generalInfo"]
        
        NeuraSDK.sharedInstance().authenticate(withPermissions: permissions as [String], userInfo: nil, on: self, withHandler: { (token, error) in
            if (token != nil && error == nil) {
                //Handle post-login actions
            } else {
                //Handle error
            }
        })
    
    }
    
    func permissionsBtnClicked()
    {
      print("permissions btn clicked")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

