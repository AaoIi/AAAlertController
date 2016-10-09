//
//  ViewController.swift
//  AAAlertController
//
//  Created by user on 5/15/16.
//  Copyright © 2016 AaoIi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let alertViews = AAAlertInterface()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func AlertWithCancel(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithCancel", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.default)
        
    }
    
    @IBAction func AlertWithCancelAndOK(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithCancelAndOK", okButtonTitle: "OK", okCompletionBlock: { () -> (Void) in
            print("OK Pressed")
            }, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
                print("Cancel Pressed")
            }, animationStyle: animationType.default)
        
    }
    
    
    @IBAction func AlertWithThreeButtons(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithThreeButtons", firstButtonTitle: "Share", firstButtonCompletionBlock: { () -> (Void) in
            
                print("Share Pressed")
            
            }, secondButtonTitle: "Rate", secondButtonCompletionBlock: { () -> (Void) in
                
                print("Rate Pressed")
                
            }, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
                
                print("Cancel Pressed")
                
            }, animationStyle: animationType.default)
        
    }
    
    @IBAction func AlertWithFadeAnimation(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithFadeAnimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.fade)
        
    }
    
    @IBAction func AlertWithShakeAnimation(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithShakeAnimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.shake)
        
    }
    @IBAction func AlertWithSlideDownAimation(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithSlideDownAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.slideDown)
        
    }
    
    
    @IBAction func AlertWithSlideUpAimation(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithSlideUpAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.slideUp)
        
    }

    @IBAction func AlertWithSlideRightAimation(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithSlideRightAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.slideRight)
        
    }
    
    @IBAction func AlertWithSlideLeftAimation(_ sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithSlideLeftAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.slideLeft)
        
    }
    
}

