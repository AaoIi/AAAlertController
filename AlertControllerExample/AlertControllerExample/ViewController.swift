//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Mobile build server on 8/7/19.
//  Copyright © 2019 Saad Albasha. All rights reserved.
//


import UIKit
import AlertController

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func AlertWithCancel(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithCancel", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
        }, animationStyle: .default)
        
    }
    
    @IBAction func AlertWithCancelAndOK(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithCancelAndOK", firstButtonTitle: "OK", firstActionCompletion: { () -> (Void) in
            print("OK Pressed")
        }, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
            print("Cancel Pressed")
        }, animationStyle: .default)
        
    }
    
    
    @IBAction func AlertWithThreeButtons(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithThreeButtons", firstButtonTitle: "Share", firstButtonCompletionBlock: { () -> (Void) in
            
            print("Share Pressed")
            
        }, secondButtonTitle: "Rate", secondButtonCompletionBlock: { () -> (Void) in
            
            print("Rate Pressed")
            
        }, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
            
            print("Cancel Pressed")
            
        }, animationStyle: .default)
        
    }
    
    @IBAction func AlertWithFadeAnimation(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithFadeAnimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
        }, animationStyle: .fade)
        
    }
    
    @IBAction func AlertWithShakeAnimation(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithShakeAnimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
        }, animationStyle: .shake)
        
    }
    @IBAction func AlertWithSlideDownAimation(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithSlideDownAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
        }, animationStyle: .slideDown)
        
    }
    
    
    @IBAction func AlertWithSlideUpAimation(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithSlideUpAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
        }, animationStyle: .slideUp)
        
    }
    
    @IBAction func AlertWithSlideRightAimation(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithSlideRightAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
        }, animationStyle: .slideRight)
        
    }
    
    @IBAction func AlertWithSlideLeftAimation(_ sender: AnyObject) {
        
        AlertController.show("Hello", message: "AlertWithSlideLeftAimation", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
            print("Cancel Pressed")
        }, animationStyle: .slideLeft)
        
    }
    
}

