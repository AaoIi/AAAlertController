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


    @IBAction func AlertWithCancel(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithCancel", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.Default)
        
    }
    
    @IBAction func AlertWithCancelAndOK(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithCancelAndOK", okButtonTitle: "OK", okCompletionBlock: { () -> (Void) in
            print("OK Pressed")
            }, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
                print("Cancel Pressed")
            }, animationStyle: animationType.Default)
        
    }
    
    
    @IBAction func AlertWithThreeButtons(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithThreeButtons", firstButtonTitle: "Share", firstButtonCompletionBlock: { () -> (Void) in
            
                print("Share Pressed")
            
            }, secondButtonTitle: "Rate", secondButtonCompletionBlock: { () -> (Void) in
                
                print("Rate Pressed")
                
            }, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
                
                print("Cancel Pressed")
                
            }, animationStyle: animationType.Default)
        
    }
    
    @IBAction func AlertWithFadeAnimation(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithFadeAnimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.Fade)
        
    }
    
    @IBAction func AlertWithShakeAnimation(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithShakeAnimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.Shake)
        
    }
    @IBAction func AlertWithSlideDownAimation(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithSlideDownAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.SlideDown)
        
    }
    
    
    @IBAction func AlertWithSlideUpAimation(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithSlideUpAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.SlideUp)
        
    }

    @IBAction func AlertWithSlideRightAimation(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithSlideRightAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.SlideRight)
        
    }
    
    @IBAction func AlertWithSlideLeftAimation(sender: AnyObject) {
        
        alertViews.AAAlert("Hello", message: "AlertWithSlideLeftAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
            }, animationStyle: animationType.SlideLeft)
        
    }
    
}

